class LazyLoader
  attr_accessor :parent_struct, :struct, :offset
  attr_accessor :instance
  def initialize(parent_struct,struct,offset = nil)
    self.parent_struct, self.struct, self.offset = parent_struct, struct, offset
  end
  
  def is_array?
    !parent_struct.offset.is_a?(Symbol)
  end
  
  def struct_class
    struct[0]
  end
  
  DEFAULT_LAZY_METHODS = [:[]]
  def lazy_method?(method)
    (DEFAULT_LAZY_METHODS + struct_class.array_structs).include?(method)
  end
  
  def method_missing(method,*args,&block)
    if lazy_method?(method) && !self.instance
      new_offset = method
      unless struct[1] == -1
        new_offset = args.first
      end
      if method == :[]
        new_struct = [struct_class,-1]
      else
        new_struct = struct_class.structs[method]
      end
      LazyLoader.new(self,new_struct,new_offset)
    else
      disassemble unless self.instance
      self.instance.send(method,*args,&block)
    end
  end
  
  def disassemble
    puts "disassembling"
    file = root_object.open
    file.seek(position_to_seek_to)
    self.instance = struct_class.new
    self.instance.disassemble(file)
    self.instance
  end
  
  def parent_structs
    parent = parent_struct
    parents = [parent]
    while parent.parent_struct
      parent = parent.parent_struct
      parents << parent
    end
    parents.reverse
  end
  
  def root_object
    root = parent_struct
    root = root.parent_struct while !root.is_a?(Save)
    root
  end
  
  def position_to_seek_to
    position = 0
    offsets_and_awfulness = [parent_structs[2..-1],self].flatten.select { |p| p.respond_to?(:offset) }.map(&:offset)
    args_for_offset_for = []
    offsets_and_awfulness.each do |arg|
      if arg.is_a?(Symbol)
        args_for_offset_for << [arg]
      else
        args_for_offset_for.last << arg
      end
    end
    args_for_offset_for.each_with_index do |arg_set,index|
      index += 1
      position += parent_structs[index].struct_class.offset_for(*arg_set)
    end
    position
  end
  
end
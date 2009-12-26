class LazyLoader
  attr_accessor :parent_struct, :struct, :offset
  def initialize(parent_struct,struct,offset = nil)
    self.parent_struct, self.struct, self.offset = parent_struct, struct, offset
  end
  
  def struct_class
    struct[0]
  end
  
  DEFAULT_LAZY_METHODS = [:[]]
  def lazy_method?(method)
    (DEFAULT_LAZY_METHODS + struct_class.array_structs).include?(method)
  end
  
  def method_missing(method,*args,&block)
    if lazy_method?(method)
      new_offset = nil
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
      instance = struct_class.new
      debugger
      'sdf'
    end
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
    parent_structs[1..-1].each do |parent| #skip the first, since it's not actually a struct
      
    end
  end
  
end
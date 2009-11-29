class BaseData
  attr_accessor :struct_values
  
  def self.structure(*args)
    @@struct_order ||= []
    @@structs      ||= {}
    args.each do |structure_list|
      name,struct = *structure_list
      unless struct.is_a?(Array)
        struct = [struct,-1]
      end
      struct[0] = class_from_symbol(struct[0])
      @@struct_order << name
      @@structs[name] = struct
      define_method("#{name}") do
        self.struct_values[name]
      end
      define_method("#{name}=") do |new_value|
        self.struct_values[name] = new_value
      end
    end
  end
  
  def self.class_from_symbol(symbol)
    "BaseData::#{symbol.to_s.classify}".constantize
  end
  
  def initialize
    self.struct_values = {}
  end
  
  def disassemble(file)
    @@struct_order.each do |struct_name|
      klass,count = *@@structs[struct_name]
      values = parse_normal(file,klass,count)
      self.struct_values[struct_name] = values
    end
    self
  end
  
  def parse_normal(file,klass,count)
    values = []
    #FIXME: ugly
    #-1 means no count was specified, assume we only want ONE of these, as opposed to [count] in an array
    if count >= 0
      count.times do
        value = klass.new
        value.disassemble(file)
        values << value
      end
    else
      values = klass.new
      values.disassemble(file)
    end
    values
  end
  
end
class BaseData
  attr_accessor :struct_values
  
  def self.structure(*args)
    @@struct_order ||= []
    @@structs      ||= {}
    args.each do |structure_list|
      name,struct = *structure_list
      unless struct.is_a?(Array)
        struct = [struct,1]
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
      values = []
      count.times do
        value = klass.new
        value.disassemble(file)
        values << value
      end
      self.struct_values[struct_name] = values
    end
    self
  end
  
end
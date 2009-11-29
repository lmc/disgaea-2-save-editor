class BaseData
  attr_accessor :struct_values
  
  def self.structure(*args)
    @@structs ||= []
    args.each do |structure_list|
      name,struct = *structure_list
      define_method("#{name}") do
        self.struct_values[name]
      end
      define_method("#{name}=") do |new_value|
        self.struct_values[name] = new_value
      end
    end
  end
  
  def initialize
    self.struct_values = {}
  end
  
  def disassemble(file)
    
  end
  
end
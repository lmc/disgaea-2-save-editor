class BaseData::Base
  def self.struct_size; nil; end
  
  attr_accessor :value
  
  def disassemble(file_object)
    raise "disassemble not implemented in #{self.inspect}"
    self.value = nil
  end
  
  def assemble(ruby_value)
    raise "assemble not implemented in #{self.inspect}"
  end
  
  def raw_from_file(file_object)
    file_object.read(self.class.struct_size)
  end
  
end
class BaseData::Base
  def self.struct_size; nil; end
  
  attr_accessor :value
  
  def assemble(file_data)
    file_data.write(as_raw)
  end
  
  def disassemble(file_object)
    raise "disassemble not implemented in #{self.inspect}"
    self.value = nil
  end
  
  def raw_from_file(file_object)
    file_object.read(self.class.struct_size)
  end
  
  def inspect
    "#<D2 #{self.class.name.demodulize} #{inspect_value}>"
  end
  
  def inspect_value
    self.value
  end
  
end
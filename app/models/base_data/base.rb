class BaseData::Base
  @@size = nil
  
  attr_accessor :raw
  
  def disassemble
    raise "disassemble not implemented in #{self.inspect}"
  end
  
  def assemble
    raise "assemble not implemented in #{self.inspect}"
  end
end
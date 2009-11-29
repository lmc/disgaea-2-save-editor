class BaseData::TimeStamp < BaseData::Base
  def self.struct_size; 4; end
  
  attr_accessor :hours,:minutes,:seconds
  
  def disassemble(file_data)
    self.value   = raw_from_file(file_data)
    self.hours   = value[0..1].unpack('c').first
    self.minutes = value[2]
    self.seconds = value[3]
  end
  
  def inspect_value
    "#{hours}:#{minutes}:#{seconds}"
  end
end
class BaseData::TimeStamp < BaseData::Base
  def self.struct_size; 4; end
  
  undef value #HACK: undeffing value so the pass-through code in structure.rb will treat timestamp as another structure-having class
  attr_accessor :hours,:minutes,:seconds
  
  def disassemble(file_data)
    raw          = raw_from_file(file_data)
    self.hours   = raw[0..1].unpack('c').first
    self.minutes = raw[2]
    self.seconds = raw[3]
  end
  
  def inspect_value
    "#{hours}:#{minutes}:#{seconds}"
  end
end
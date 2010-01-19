#FIXME: Refactor using structure
class BaseData::TimeStamp < BaseData::Base
  def self.struct_size; 4; end
  
  undef value #HACK: undeffing value so the pass-through code in structure.rb will treat timestamp as another structure-having class
  attr_accessor :hours,:minutes,:seconds
  
  def disassemble(file_data)
    raw          = raw_from_file(file_data)
    self.hours   = raw[0..1].unpack('s').first
    self.minutes = raw[2]
    self.seconds = raw[3]
  end
  
  def in_seconds
    (self.hours * 60 * 60) + (self.minutes * 60) + self.seconds
  end
  
  def as_raw
    [[self.hours].pack('s'),self.minutes.chr,self.seconds.chr].join('')
  end
  
  def inspect_value
    "#{hours}:#{minutes}:#{seconds}"
  end
end
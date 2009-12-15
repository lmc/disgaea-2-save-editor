class BaseData::Uint8 < BaseData::Int8
  def self.struct_size; 1; end
  def self.limits; -128..127; end
  
  def self.unsigned_to_signed(value)
    value > 127 ? (-128 + (value & 127)) : value
  end
  
  def self.signed_to_unsigned(value)
    value < 0 ? (128 + (128 + value))  : value
  end
  
  def convert(raw_data)
    self.class.unsigned_to_signed(raw_data.ord)
  end
  
  def as_raw
    self.class.signed_to_unsigned(value).chr
  end
end
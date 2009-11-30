#A big fuck-it bucket to stop 2000-entry long arrays from flooding your terminal
class BaseData::UnknownCollection < BaseData::StringCollection
  undef value #HACK
  
  def inspect_value
    "size=#{size}"
  end
  
  def as_string
    strings.map(&:value).map(&:chr)
  end
  
  def as_int8
    strings.map(&:value)
  end
  
  def as_int16(offset = 0)
    #as_int8.in_groups_of(2)
  end
  
  def as_int32(offset = 0)
    
  end
  
end
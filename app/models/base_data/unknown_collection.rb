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
    int8s = as_int8
    offset.times { int8s.shift }
    int8s.in_groups_of(2).map do |args|
      BaseData::Int16.new.convert(args.compact.map(&:chr).join)
    end
  end
  
  def as_int32(offset = 0)
    
  end
  
end
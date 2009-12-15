#A big fuck-it bucket to stop 2000-entry long arrays from flooding your terminal
class BaseData::UnknownCollection < BaseData::StringCollection
  undef value #HACK
  
  def inspect_value
    "size=#{size}"
  end
  
  def as_raw
    as_string.join
  end
  
  def as_string
    strings.map(&:value).map(&:chr)
  end
  
  def as_int8(unsigned = false)
    ints = strings.map(&:value)
    ints.map! { |int| BaseData::Uint8.unsigned_to_signed(int) } if unsigned
    ints
  end
  
  def as_int16(offset = 0,unsigned = false)
    int8s = as_int8
    offset.times { int8s.shift }
    int8s.in_groups_of(2).map do |args|
      klass = unsigned ? BaseData::Uint16 : BaseData::Int16
      klass.new.convert(args.compact.map(&:chr).join)
    end
  end
  
  def as_uint16(offset = 0)
    as_int16(offset,true)
  end
  
  def as_int32(offset = 0)
    int8s = as_int8
    offset.times { int8s.shift }
    int8s.in_groups_of(4).map do |args|
      BaseData::Int32.new.convert(args.compact.map(&:chr).join)
    end
  end
  
end
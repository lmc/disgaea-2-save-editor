#A big fuck-it bucket to stop 2000-entry long arrays from flooding your terminal
class BaseData::UnknownCollection < BaseData::StringCollection
  
  def inspect_value
    "size=#{size}"
  end
end
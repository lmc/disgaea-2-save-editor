class BaseData::DisgaeaStringCollection < BaseData::StringCollection
  
  def as_raw
    str = BaseData::DisgaeaString.untranslate(value).join
    str[0...(strings.size)] #only the original size of our string
  end
  
  def value
    BaseData::DisgaeaString.translate(super)
  end
  
end
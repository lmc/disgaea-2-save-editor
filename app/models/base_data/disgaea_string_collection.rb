class BaseData::DisgaeaStringCollection < BaseData::StringCollection
  
  def value
    BaseData::DisgaeaString.translate(super)
  end
  
end
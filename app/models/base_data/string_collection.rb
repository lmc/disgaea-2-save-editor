class BaseData::StringCollection < BaseData::Base
  attr_accessor :strings
  delegate :[],:size, :to => :strings
  
  def initialize(strings = [])
    self.strings = strings
  end
  
  def value
    strings.map(&:value).join
  end
  
  def value=(new_value)
    strings.each_with_index do |string,index|
      string.value = index > new_value.size ? 0.chr : new_value[index,1]
    end
    value
  end
  
  def as_raw
    value
  end
  
end
#Just some shared functionality for all int data types
class BaseData::Int < BaseData::Base
  
  def validate_and_limit(new_value)
    #Keep numbers capped within our datatype's limits
    new_value ||= 0
    new_value   = [new_value,self.class.limits.first].max
    new_value   = [new_value,self.class.limits.last ].min
    new_value
  end
  
  def value=(new_value)
    new_value ||= 0
    debugger if new_value != validate_and_limit(new_value) && new_value < 0
    if self.is_a?(BaseData::Int8) #Problems @___@
      super
    else
      super(validate_and_limit(new_value))
    end
  end
  
  def raw_from_file(file)
    resp = super
    #debugger if self.is_a?(BaseData::Uint32) && convert(resp) < 0
    resp
  end
  
end
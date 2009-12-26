module FakeActiveRecord
  def self.included(base)
    base.send(:include,InstanceMethods)
    base.send(:extend, ClassMethods)
    base.send(:include,Validatable)
  end
  
  module ClassMethods
    def human_name
      name.humanize
    end
  end
  
  module InstanceMethods
    def to_param
      "#{id}"
    end
    
    def id #to shut up depreciation warnings
      respond_to?(:parent_position) ? parent_position : object_id
    end
    
    def new_record?
      false
    end
    
    def update_attributes(attributes = {})
      attributes.each_pair do |key,value|
        assign_method = "#{key}="
        raise(ArgumentError, "No attribute setter #{assign_method}") unless respond_to?(assign_method)
        send(assign_method,value)
      end
      valid?
    end
  end
end

class Validatable::Errors
  alias_method :[], :on
end

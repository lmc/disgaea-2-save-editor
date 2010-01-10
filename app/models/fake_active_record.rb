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
      respond_to?(:parent_position) ? (parent_position || hack_parent_position) : object_id
    end
    
    #FIXME: this is just a hack, since either the lazy loader or the disassembler aren't setting parent_position correctly
    def hack_parent_position
      parent_struct.index(self)
    end
    
    def new_record?
      false
    end
    
    def update_attributes(attributes = {},first_call = true)
      attributes.each_pair do |key,value|
        next if send(key).is_a?(BaseData::UnknownCollection)
        if value.is_a?(Hash)
          send(key).update_attributes(value,false)
        else
          assign_method = "#{key}="
          raise(ArgumentError, "No attribute setter #{assign_method}") unless respond_to?(assign_method)
          send(assign_method,value)
        end
      end
      (first_call && self.lazy_loader.assemble) && valid?
    end
  end
end

class Validatable::Errors
  alias_method :[], :on
end

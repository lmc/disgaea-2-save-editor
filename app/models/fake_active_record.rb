#module ActiveRecord; end
#class ActiveRecord::Base; end
#class ActiveRecord::ActiveRecordError < StandardError; end

module FakeActiveRecord
  def self.included(base)
    base.send(:include,InstanceMethods)
    base.send(:extend, ClassMethods)
    #base.send(:include,ActiveRecord::Validations)
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
  end
  
end

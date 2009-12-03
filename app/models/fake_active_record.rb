module FakeActiveRecord
  def self.included(base)
    base.send(:include,InstanceMethods)
    base.send(:extend, ClassMethods)
  end
  
  module ClassMethods
    def human_name
      name.humanize
    end
  end
  
  module InstanceMethods
    def id #to shut up depreciation warnings
      object_id
    end
    
    def new_record?
      false
    end
  end
  
end
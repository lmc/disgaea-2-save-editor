module Structure
  
  def self.included(base)
    base.instance_eval do
      @struct_order ||= []
      @structs      ||= {}
      class << self
        attr_accessor :struct_order, :structs
      end
      
      def self.structure(*args)
        args.each do |structure_list|
          name,struct = *structure_list
          unless struct.is_a?(Array)
            struct = [struct,-1]
          end
          struct[0] = class_from_symbol(struct[0])
          self.struct_order << name
          self.structs[name] = struct
          define_method("#{name}_struct") do
            self.struct_values[name]
          end
          define_method("#{name}_struct=") do |new_value|
            self.struct_values[name] = new_value
          end
          define_method("#{name}") do
            struct = self.struct_values[name]
            struct.respond_to?(:value) ? struct.value : struct
          end
          define_method("#{name}=") do |new_value|
            if self.struct_values[name].respond_to?(:value)
              self.struct_values[name].value = new_value
            else
              self.struct_values[name] = new_value
            end
          end
        end
      end
      
      extend  ClassMethods
      include InstanceMethods
    end
  end
  
  module ClassMethods

    def class_from_symbol(symbol)
      if symbol.is_a?(Symbol)
        "BaseData::#{symbol.to_s.classify}".constantize
      else
        symbol
      end
    end
  end
  
  module InstanceMethods
    
  end
  
end
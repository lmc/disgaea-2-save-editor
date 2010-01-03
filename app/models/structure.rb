module Structure
  
  def self.included(base)
    base.instance_eval do
      @struct_order ||= []
      @structs      ||= {}
      @structure_root = false
      
      class << self
        attr_accessor :struct_order, :structs, :structure_root
      end
      attr_accessor :lazy_loader
      
      def self.structure_root!
        self.structure_root = true
      end
      
      def self.structure(*args)
        total_size = 0
        args.each do |structure_list|
          name,struct = *structure_list
          unless struct.is_a?(Array)
            struct = [struct,-1]
          end
          struct[0] = class_from_symbol(struct[0])
          
          start_pos = total_size
          if struct[0].respond_to?(:struct_size)
            total_size += struct[0].struct_size * struct[1].abs
          end
          end_pos = total_size
          
          self.struct_order << name
          self.structs[name] = struct
          
          struct += [start_pos,end_pos]
          
          define_method("#{name}_struct") do
            self.struct_values[name]
          end
          define_method("#{name}_struct=") do |new_value|
            self.struct_values[name] = new_value
          end
          define_method("#{name}") do
            struct = self.struct_values[name]
            struct ||= LazyLoader.new(self,self.class.structs[name])
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
        
        metaclass.instance_eval do
          define_method(:struct_size) do
            total_size
          end
        end        
      end
      
      extend  ClassMethods
      include InstanceMethods
    end
  end
  
  module ClassMethods
    
    def array_structs
      names = []
      structs.each_pair do |name,struct|
        names << name if struct[1] >= 0 && !struct[0].ancestors.include?(BaseData::PlainString)
      end
      names
    end
    
    def offset_for(struct_name,offset_in_array_struct = nil)
      position_of_struct = struct_order.index(struct_name)
      raise "No known offset for #{struct_name} in #{self.inspect}" unless position_of_struct
      offset = 0
      struct_order[0...position_of_struct].each do |i_struct_name|
        i_struct = structs[i_struct_name]
        offset += i_struct[0].struct_size * i_struct[1].abs
      end
      if offset_in_array_struct
        size_of_struct = structs[struct_name][0].struct_size
        offset += offset_in_array_struct.to_i * size_of_struct
      end
      offset
    end

    def class_from_symbol(symbol)
      if symbol.is_a?(Symbol)
        symbol = :plain_string if symbol == :string
        "BaseData::#{symbol.to_s.classify}".constantize
      else
        symbol
      end
    end
  end
  
  module InstanceMethods
    def struct_values_in_order
      values = []
      self.class.struct_order.each do |method|
        values << send(method)
      end
      values
    end
  end
  
end
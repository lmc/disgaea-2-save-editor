class BaseData
  include FakeActiveRecord
  attr_accessor :struct_values
  
  #Clean up a string for display
  def self.clean(str)
    str.strip
  end

  def initialize
    self.struct_values = {}
  end
  
  def comp_values
    struct_values.map { |key,value| [key,value.value] }
  end
  
  #FIXME: These are way too closely coupled and are doing too much magic. Refactor the whole lot once it's working.
  def assemble(file)
    self.class.struct_order.each do |struct_name|
      [self.struct_values[struct_name]].flatten.each do |struct_value|
        #debugger unless struct_value
        unless struct_value.nil?
          struct_value.assemble(file)
        else
          struct = self.class.structs[struct_name]
          raise "Can't handle unstructured value #{struct.inspect} = #{struct_value}" unless struct[1] == -1
          klass = struct[0].new
          klass.value = send(struct_name)
          klass.assemble(file)
        end
      end
    end
    file
  end
  
  attr_accessor :parent_struct
  def self.add_parent_struct(instance,parent_struct)
    if instance.respond_to?(:parent_struct=)
      instance.parent_struct = parent_struct
    else
      raise "no parent_struct= on #{instance.inspect}"
    end
  end
  
  def struct_position
    
  end
  
  def disassemble(file)
    self.class.struct_order.each do |struct_name|
      klass,count = *self.class.structs[struct_name]
      values = parse_normal(file,klass,count)
      self.class.add_parent_struct(values,self)
      if respond_to?("#{struct_name}=")
        self.send("#{struct_name}=",values)
      else
        self.struct_values[struct_name] = values
      end
    end
    self
  end
  
  def parse_normal(file,klass,count)
    values = StructArray.new
    #FIXME: ugly
    #-1 means no count was specified, assume we only want ONE of these, as opposed to [count] in an array
    if count >= 0
      count.times do
        value = klass.new
        value.disassemble(file)
        self.class.add_parent_struct(value,values)
        values << value
      end
      if klass == BaseData::PlainString
        values = BaseData::StringCollection.new(values)
      elsif klass == BaseData::Unknown
        values = BaseData::UnknownCollection.new(values)
      elsif klass == BaseData::DisgaeaString
        #HACK: Try to guess whether this is a normal or disgaea string
        if values.first.value.ord >= 128
          values = BaseData::DisgaeaStringCollection.new(values)
        else
          values = BaseData::StringCollection.new(values)
        end
      end
    else
      values = klass.new
      values.disassemble(file)
    end
    values
  end
  
end
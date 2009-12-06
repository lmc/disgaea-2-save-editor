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
  
  def self.assemble(ruby_value)
    
  end
  
  def self.disassemble(raw_value)
    
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
  
  def disassemble(file)
    self.class.struct_order.each do |struct_name|
      klass,count = *self.class.structs[struct_name]
      values = parse_normal(file,klass,count)
      if respond_to?("#{struct_name}=")
        self.send("#{struct_name}=",values)
      else
        self.struct_values[struct_name] = values
      end
    end
    self
  end
  
  def parse_normal(file,klass,count)
    values = []
    #FIXME: ugly
    #-1 means no count was specified, assume we only want ONE of these, as opposed to [count] in an array
    if count >= 0
      count.times do
        value = klass.new
        value.disassemble(file)
        values << value
      end
      if klass == BaseData::String
        values = BaseData::StringCollection.new(values)
      elsif klass == BaseData::Unknown
        values = BaseData::UnknownCollection.new(values)
      elsif klass == BaseData::DisgaeaString
        values = BaseData::DisgaeaStringCollection.new(values)
      end
    else
      values = klass.new
      values.disassemble(file)
    end
    values
  end
  
end
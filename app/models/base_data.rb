class BaseData
  attr_accessor :struct_values

  def initialize
    self.struct_values = {}
  end
  
  def comp_values
    struct_values.map { |key,value| [key,value.value] }
  end
  
  def disassemble(file)
    self.class.struct_order.each do |struct_name|
      klass,count = *self.class.structs[struct_name]
      values = parse_normal(file,klass,count)
      self.struct_values[struct_name] = values
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
      end
    else
      values = klass.new
      values.disassemble(file)
    end
    values
  end
  
end
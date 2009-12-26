class Save < BaseData
  attr_accessor :filename
  attr_accessor :file
  attr_accessor :header
  attr_accessor :characters
  attr_accessor :structures
  
  def initialize(filename = nil)
    filename ||= File.join(RAILS_ROOT,'data','saves','ULUS10461DISGAEA000','SDDATA.BIN')
    self.filename = filename
    self.structures = LazyLoader.new(self,[SaveStructure,-1])
  end
  
  def open
    self.file = File.open(filename,'r')
  end
  
  def disassemble
    open
    #self.structures = SaveStructure.new.disassemble(file)
    #self.header = self.structures.header
    #self.characters = self.structures.characters
    self
  end
  
  def struct_class
    self.class
  end
  
end
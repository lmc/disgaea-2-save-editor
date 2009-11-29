class Save
  attr_accessor :filename
  attr_accessor :file
  attr_accessor :header
  attr_accessor :characters
  
  def initialize(filename = nil)
    filename ||= File.join(RAILS_ROOT,'data','saves','ULUS10461DISGAEA000','SDDATA.BIN')
    self.filename = filename
  end
  
  def open
    self.file = File.open(filename,'r')
  end
  
  def disassemble
    open
    self.header = SaveHeader.new.disassemble(file)
    self.characters = Characters.new.disassemble(file)
    self
  end
  
end
class Save
  attr_accessor :filename
  attr_accessor :file
  attr_accessor :structure
  
  def initialize(filename = nil)
    filename ||= File.join(RAILS_ROOT,'data','saves','ULUS10461DISGAEA000','SDDATA.BIN')
    self.filename = filename
    self.structure = []
  end
  
  def open
    self.file = File.open(filename,'r')
  end
  
  def disassemble
    open
    SaveHeader.new.disassemble(file)
  end
  
end
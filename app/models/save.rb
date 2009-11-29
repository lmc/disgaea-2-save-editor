class Save
  attr_accessor :filename
  attr_accessor :file
  attr_accessor :header
  
  def initialize(filename = nil)
    filename ||= File.join(RAILS_ROOT,'data','saves','ULUS10461DISGAEA000','SDDATA.BIN')
    self.filename = filename
  end
  
  def open
    self.file = File.open(filename,'r')
  end
  
  def seek(position = 0)
    self.file.seek(position,IO::SEEK_SET)
  end
  
  def disassemble
    open
    seek(0)
    self.header = SaveHeader.new.disassemble(file)
    self
  end
  
end
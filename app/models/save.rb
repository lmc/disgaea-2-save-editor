class Save
  attr_accessor :filename
  attr_accessor :file
  
  def initialize(filename = nil)
    filename ||= File.join(RAILS_ROOT,'data','saves','ULUS10461DISGAEA000','SDDATA.BIN')
    self.filename = filename
  end
  
  def open
    self.file = File.open(filename,'r')
  end
  
  
  
end
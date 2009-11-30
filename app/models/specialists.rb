class Specialists < Array 
  def self.struct_count; 8; end
   
  def disassemble(file)
    self.class.struct_count.times do
      specialist = Specialist.new
      specialist.disassemble(file)
      self << specialist
    end
    self
  end
  
end
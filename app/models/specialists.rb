require 'specialist'
class Specialists < Array 
  def self.struct_count; 8; end
  def self.struct_size
    Specialist.struct_size * 8
  end
   
  def disassemble(file)
    self.class.struct_count.times do
      specialist = Specialist.new
      specialist.disassemble(file)
      self << specialist
    end
    self
  end
  
  def assemble(file)
    self.each do |specialist|
      specialist.assemble(file)
    end
  end
  
end
class Items < Array 
  def self.struct_count; nil; end #Subclass and override
   
  def disassemble(file)
    self.class.struct_count.times do
      item = Item.new
      item.disassemble(file)
      self << item
    end
    self
  end
  
end
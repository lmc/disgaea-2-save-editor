require 'character'
class Characters < Array
  START_AT = 3288
  
  def self.struct_count; 128; end
  def self.struct_size
    Character.struct_size * struct_count
  end
  
  def disassemble(file)
    #file.seek(START_AT)
    #FIXME: Find out how many characters are stored in the save
    self.class.struct_count.times do
      character = Character.new
      character.disassemble(file)
      self << character
    end
    self
  end
  
  def assemble(file)
    self.each do |character|
      character.assemble(file)
    end
  end
  
  def <<(item)
    super
    if item.respond_to?(:parent_position)
      item.parent_position = (self.size - 1)
    end
  end
  
end
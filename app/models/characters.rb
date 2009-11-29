class Characters < Array
  
  def disassemble(file)
    file.seek(3288)
    #FIXME: Find out how many characters are stored in the save
    1.times do
      character = Character.new
      character.disassemble(file)
      self << character
    end
    self
  end
  
end
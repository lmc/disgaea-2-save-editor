class Characters < Array
  START_AT = 3288
  
  def disassemble(file)
    file.seek(START_AT)
    #FIXME: Find out how many characters are stored in the save
    16.times do
      character = Character.new
      character.disassemble(file)
      self << character
    end
    self
  end
  
end
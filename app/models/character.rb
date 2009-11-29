class Character < BaseData
  include Structure
  #each character is 3,072 bytes
  
  structure(
    [:experience,     :uint32]
  )
  
  def disassemble(file)
    returning super(file) do
      (3072 - 4).times { file.read(1) }
    end
  end
end
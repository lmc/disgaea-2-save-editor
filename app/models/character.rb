class Character < BaseData
  include Structure
  
  structure(
    [:experience,     :int32]
  )
  
  def disassemble(file)
    super(file)
    #(6360 - 4).times { file.read }
  end
end
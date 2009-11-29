class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,     :uint64],
    [:unknown,        [:int8,2512]],
    [:stats,          Stats]
  )
  
  def disassemble(file)
    returning super(file) do
      (SIZE - 4).times { file.read(1) }
    end
  end
end
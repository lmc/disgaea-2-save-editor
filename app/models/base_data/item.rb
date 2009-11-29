class Item < BaseData
  include Structure
  
  structure(
    [:specialists,    [Specialist,10]],
    [:stats,          Stats],
    [:base_stats,     Stats],
    [:type,           :int16],
    [:level,          :int16]
  )
  
  def disassemble(file)
    returning super(file) do
      (SIZE - 4).times { file.read(1) }
    end
  end
end
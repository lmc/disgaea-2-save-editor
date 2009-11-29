class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,       :uint64],
    [:unknown01,        [:int8,2512]],
    [:stats,            Stats],
    [:base_stats_maybe, Stats],
    [:unknown02,        [:int32,8]],
    [:mana,             :uint32]
  )
  
  def disassemble(file)
    returning super(file) do
      (SIZE - 4).times { file.read(1) }
    end
  end
end
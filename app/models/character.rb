class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,         :uint64],
    [:unknown01,          [:int8,2512]],
    [:stats,              Stats],
    [:base_stats_maybe,   Stats],
    [:unknown02,          [:int8,32]],
    [:mana,               :uint32],
    [:unknown03,          [:int8,78]],
    [:felonies_total,     Int16],
    [:felonies_displayed, Int16],
    [:unknown04,          [:int8,374]]
  )

end
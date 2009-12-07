class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,         :uint64],
    [:items,              CharacterItems],
    [:name,               [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,         [:string,61]],
    [:tunknown,           [:unknown,1382]],
    [:stats,              Stats], #calculated stats?
    [:base_stats_maybe,   Stats], #intrinsic (naked) stats?
    [:unknown02,          [:unknown,32]],
    [:mana,               :uint32],
    #[:unknown03,          [:unknown,78]],
    [:unknown03,          [:unknown,48]],
    [:basic_stats,        BasicStats],
    [:unknown04,          [:unknown,22]],
    [:felonies_total,     :int16],
    [:felonies_displayed, :int16],
    [:unknown05,          [:unknown,374]]
  )

end
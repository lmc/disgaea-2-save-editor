class Character < BaseData
  include Structure
  SIZE = 3072
  
  structure(
    [:experience,         :uint64],
    [:items,              CharacterItems],
    [:name,               [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,         [:string,61]],
    [:tunknown,           [:unknown,1382]],
    [:stats,              Stats],
    [:base_stats_maybe,   Stats],
    [:unknown02,          [:unknown,32]],
    [:mana,               :uint32],
    [:unknown03,          [:unknown,78]],
    [:felonies_total,     Int16],
    [:felonies_displayed, Int16],
    [:unknown04,          [:unknown,374]]
  )

end
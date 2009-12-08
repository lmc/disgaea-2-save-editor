class Character < BaseData
  include Structure
  SIZE = 3072
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  structure(
    [:experience,         :uint64],
    [:items,              CharacterItems],
    [:name,               [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,         [:string,61]],
    #[:tunknown,           [:unknown,810]],
    [:tunknown,           [:unknown,144]],
    #weapon skill level starts at 810, how long? (end 920?)
    [:weapon_skill_exp,   [:int32,111]],
    [:weapon_skill,       [:int16,111]],
    
    [:weapon_skill_level, [:int8,111]],
    [:uunknown,           [:unknown,453]],
    [:current_hp,         :int32],
    [:current_sp,         :int32],
    [:stats,              Stats], #calculated stats?
    [:base_stats_maybe,   Stats], #intrinsic (naked) stats?
    [:unknown02,          [:unknown,32]],
    [:mana,               :uint32],
    [:unknown03,          [:unknown,10]], #seems to be int16s. only on kyoko and miki, something related to pupils?
    [:weapon_unknown,     WeaponSkills], #seems to mirror weapon_grade, somewhat. effective grade, changed by weapon scrolls? 
    [:weapon_grade,       WeaponSkills], #the A/B/C/D/E grades given on the weapon mastery screen
    [:weapon_mastery,     WeaponSkills],
    [:unknown04,          [:unknown,17]], #just seems to be more repeating values, related to weapon skills?
    [:basic_stats,        BasicStats],
    [:unknown05,          [:unknown,22]],
    [:felonies_total,     :int16],
    [:felonies_displayed, :int16],
    [:unknown06,          [:unknown,374]]
  )

end
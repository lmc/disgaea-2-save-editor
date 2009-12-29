class Character < BaseData
  include Structure
  SIZE = 3072
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  validates_numericality_of :experience
  
  #Need to find:
  #Magichange 2 enabled
  #teacher id
  #character class id
  #character colour id
  #base counter/mv (or the +1 flags from dark assembly "More counters/More movement" bills)
  #reincarnation count
  #stored levels
  structure(
    [:experience,         :uint64],
    [:items,              [Item,4]],
    [:name,               [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,         [:string,61]],
    [:tunknown,           [:unknown,138]],
    
    [:weapon_skills,      WeaponSkills],
    #Some stupid way of ordering the weapon skills, not exactly sure how it works
    [:weapon_skills_order_1,[:int16,112]],
    [:weapon_skills_order_2,[:int16,112]],
    
    [:weapon_skill_count, :int32],
    
    [:current_hp,         :int32],
    [:current_sp,         :int32],
    [:stats,              Stats], #calculated stats, recalculated often, according to naked_stats, equipped items, pupils, etc.
    [:naked_stats,        Stats], #intrinsic (naked) stats
    [:unknown02,          [:unknown,32]],
    [:mana,               :uint32],
    [:unknown03,          [:unknown,10]], #seems to be int16s. only on kyoko and miki, something related to pupils?
    [:weapon_unknown,     WeaponMastery], #seems to mirror weapon_grade, somewhat. effective grade, changed by weapon scrolls? 
    [:weapon_grade,       WeaponMastery], #the A/B/C/D/E grades given on the weapon mastery screen
    [:weapon_mastery,     WeaponMastery],
    [:unknown04,          [:unknown,17]], #just seems to be more repeating values, related to weapon skills?
    [:basic_stats,        BasicStats],
    [:unknown05,          [:unknown,22]],
    [:felonies_total,     :int16],
    [:felonies_displayed, :int16],
    [:base_element_stats, ElementalStats],
    [:element_stats,      ElementalStats],
    [:unknown06,          [:unknown,368]]
  )

end
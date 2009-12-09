class Character < BaseData
  include Structure
  SIZE = 3072
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  structure(
    [:experience,         :uint64],
    [:items,              CharacterItems],
    [:name,               [:disgaea_string,41]], #FIXME: Story characters seem to use a string-table id
    [:class_name,         [:string,61]],
    [:tunknown,           [:unknown,138]],
    
    #NOTE!: Weapon skills are not nessecarily stored in the order they're displayed
    [:weapon_skill_exp,   [:int32,112]],
    [:weapon_skill,       [:int16,112]],
    [:weapon_skill_level, [:int8,112]],
    #Maybe some stuff in uunknown controls the order?
    [:uunknown,           [:unknown,448]],
    
    [:weapon_skill_count, :int32],
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
  
  WEAPON_SKILLS = [
    201  => [:sword,nil,'Blade Rush'],
    202  => [:sword,nil,'Hurricane Slash'],
    203  => [:sword,nil,'Moon Slash'],
    204  => [:sword,nil,'Winged Slayer'],
    205  => [:sword,nil,'Dark X Slash'],
    206  => [:sword,nil,'Dimension Slash'],
    207  => [:sword,nil,'Ultra Overlord'],
    
    301  => [:spear,nil,'Impaler'],
    302  => [:spear,nil,'Lightning Spear'],
    303  => [:spear,nil,'Asteroid Drop'],
    
    401  => [:bow,  nil,'Poison Blast'],
    402  => [:bow,  nil,'Raiden Missle'],
    403  => [:bow,  nil,'Delta Split'],
    
    #Most specials for certain characters will look weird with other characters due to missing
    #animation frames
    1011 => [:special,:adell,'Crimson Flame'],
    1012 => [:special,:adell,'Soaring Fire'],
    1013 => [:special,:adell,'Vulcan Blaze'],
    
    1021 => [:special,:rozalin,'Rose Thorns'],
    1022 => [:special,:rozalin,'Kneel Before Me'],
    1023 => [:special,:rozalin,'Rose Liberation'],
    
    1031 => [:special,:axel,'Shocking Soul'],
    1032 => [:special,:axel,'My Heart Shakes'],
    1033 => [:special,:axel,'Love Dynamite'],
    
    1041 => [:special,:etna,'Prinny Raid'],
    1042 => [:special,:etna,'Sexy Beam'],
    1043 => [:special,:etna,'Chaos Impact'],
    
    1051 => [:special,:yukimaru,'Nadarejin'],
    
    #NOTE: Assigning bad weapon_skill values will hard-lock the PSP when you go to use the character
    #in battle. The skills will not been shown on the status screens outside of battle.
    #Some of these are bad
    #1052
    #1053
    #1061
    #1062
    #1063
    #1071
    #1072
    
    2125 => [:special,:mothman,'Mothman Shot'],
    2121 => [:special,:mothman,'Hell Pollen'],
    2122 => [:special,:mothman,'Bug Hypnosis'],
    2123 => [:special,:mothman,'Ultra Sound'],
    2124 => [:special,:mothman,'Tornado Dive'],
    2126 => [:special,:mothman,'Mothman Go'],
    
    
  ]

end
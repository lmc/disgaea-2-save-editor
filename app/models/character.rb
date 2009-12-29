class Character < BaseData
  include Structure
  SIZE = 3072
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  validates_numericality_of :experience
  
  #Need to find:
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
    [:unknown03,          [:unknown,16]], #int16s, something related to pupils? stat bonuses?
    [:eunknown,           [:unknown,8]],
    [:weapon_mastery,     WeaponMastery],
    [:weapon_pad_01,      :int8],
    [:weapon_grade,       WeaponMastery], #adjusted for scrolls
    [:weapon_pad_02,      :int8],
    [:base_weapon_grade,  WeaponMastery],
    [:weapon_pad_03,      :int8],
    [:basic_stats,        BasicStats],
    [:unknown05,          [:unknown,22]],
    [:felonies_total,     :int16],
    [:felonies_displayed, :int16],
    [:base_element_stats, ElementalStats],
    [:element_stats,      ElementalStats],
    [:base_jmp,           :int8],
    [:jmp,                :int8],
    [:base_mv,            :int8],
    [:mv,                 :int8],
    [:base_counter,       :int8],
    [:counter,            :int8],
    [:gender,             :int8], #not sure, looks it though. 1 = male, 2 = female
    [:unknown07,          [:unknown,1]],
    [:rank_colour,        :int8], #TEST: changed when painted
    [:unknown08,          [:unknown,8]],
    [:class_id,           :int8], #whether a lady samurai, magic knight, etc.
    [:class_rank,         :int8], #what rank of class
    [:unknown06,          [:unknown,3]], #Last int8 = character name type? 1 = completely custom, 2 = randomly-selected name, 3 = storyline name?
    [:teacher_id,         :int8], #the character with the matching id_as_teacher, is this student's teacher. 255 = no teacher
    [:id_as_teacher,      :int8],
    #[:unknown09,          [:unknown,61]],
    [:unknown09,          [:unknown,46]],
    [:class_id_unknown,   :int8], #something unique for each character class. initial string table id?
    [:unknown11,          [:unknown,14]],
    [:magichange_2,       :int8],
    [:unknown10,          [:unknown,282]]
  )
  
  #FIXME: Find out 'official' names (game uses rank 1 names, not proper class names)
  CLASS_IDS = {
    1  => :adell,
    2  => :rozalin,
    
    11 => :tink,
    12 => :hanako,
    
    26 => :raspberyl,
    
    40 => :fighter,
    41 => :lady_fighter,
    43 => :mage,
    44 => :lady_mage,
    45 => :ninja,#
    46 => :lady_ninja,#
    47 => :maijin, #
    48 => :heavy_knight,#
    49 => :sinnner, #
    50 => :geo_guy, #
    51 => :samurai,
    52 => :gunner, #
    53 => :thief,
    54 => :healer,
    55 => :archer, #
    56 => :beast_tamer, #
    57 => :magic_knight,
    58 => :lady_samurai
  }

end
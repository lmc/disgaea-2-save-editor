class Character < BaseData
  include Structure
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  validates_numericality_of :experience
  
  #Need to find:
  #reincarnation count
  #  same class reincarnation count (you get bonus points after 10 reincarnations into the same class)
  #stored levels
  #lover effect level? (might be calculated 'live', instead of being stored)
  #improved magichange turn count (get recent save, zetta has it enabled)
  structure(
    [:experience,             :uint64],
    [:items,                  [Item,4]],
    [:name,                   [:disgaea_string,41]],
    [:class_name,             [:string,61]],
    [:tunknown,               [:unknown,138]],
    
    [:weapon_skills,          WeaponSkills],
    #Some stupid way of ordering the weapon skills, not exactly sure how it works
    [:weapon_skills_order_1,  [:int16,112]],
    [:weapon_skills_order_2,  [:int16,112]],
    
    [:weapon_skill_count,     :int32],
    
    [:current_hp,             :int32],
    [:current_sp,             :int32],
    [:stats,                  Stats], #calculated stats, recalculated often, according to naked_stats, equipped items, pupils, etc.
    [:naked_stats,            Stats], #intrinsic (naked) stats
    [:unknown02,              [:unknown,32]],
    [:mana,                   :uint32],
    [:unknown03,              [:unknown,24]], #8xint16s, something related to pupils? stat bonuses?
    [:weapon_mastery,         WeaponMastery],
    [:weapon_grade,           WeaponMastery], #adjusted for scrolls
    [:base_weapon_grade,      WeaponMastery],
    [:basic_stats,            BasicStats],
    [:unknown05,              [:unknown,22]],
    [:felonies_total,         :int16],
    [:felonies_displayed,     :int16],
    [:base_element_stats,     ElementalStats],
    [:element_stats,          ElementalStats],
    [:base_jmp,               :int8],
    [:jmp,                    :int8],
    [:base_mv,                :int8],
    [:mv,                     :int8],
    [:base_counter,           :int8],
    [:counter,                :int8],
    [:gender,                 :int8], #not sure, looks it though. 1 = male, 2 = female
    [:unknown07,              [:unknown,1]],
    [:rank_colour,            :int8], #changed when painted (used in-battle, doesn't change portrait)
    [:magic_number,           :int32], #int32 = 16776970 on EVERYTHING. maybe a magic number to say this character is valid?
    [:flying_movement,        :int8], #whether character can pass through enemies when moving
    [:equipped_weapon_range,  :int8], #set higher intrinsically for some monsters, usually 5 for guns, 2 for spears, 1 for almost everything else
    [:equipped_weapon_type,   :int8], #0=no weapon or monster weapon, rest are in same order as WeaponMastery struct
    [:unknown13,              [:unknown,1]], #maybe something to do with weapon graphics?
    [:class_id,               :int8], #whether a lady samurai, magic knight, etc.
    [:class_rank,             :int8], #what rank of class
    [:unknown06,              [:unknown,3]], #Last int8 = character name type? 1 = completely custom, 2 = randomly-selected name, 3 = storyline name?
    [:teacher_id,             :int8], #the character with the matching id_as_teacher, is this student's teacher. 255 = no teacher
    [:id_as_teacher,          :int8],
    [:unknown09,              [:unknown,46]],
    [:class_id_unknown,       :int8], #something unique for each character class. initial string table id?
    [:unknown11,              [:unknown,14]],
    [:magichange_2,           :int8],
    [:unknown10,              [:unknown,282]]
  )
  
  include ClassIds
  include RankIds
  include ExpRates
  include ExpToLevel
  
  include Images
  
  GENDERS = {
    1 => :male,
    2 => :female
  }
  
  def teacher
    return nil if teacher_id == 255
    raise "Can't seem to access parent_struct" unless parent_struct
    parent_struct.find { |character| character.id_as_teacher == self.teacher_id }
  end
  
  def self.valid_characters(characters = [])
    characters.select { |character| character.magic_number != 0 }
  end


end
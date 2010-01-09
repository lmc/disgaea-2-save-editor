class Item < BaseData
  include Structure
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  #TO FIND:
  #item world bills passed
  #item world bill attempts (max 3)
  
  structure(
    [:specialists,          [Specialist,8]],
    [:unknown01,            [:unknown,8]], #3,4 = lover spawn counter?
    [:stats,                Stats],
    [:base_stats,           Stats],
    [:item_class_id,        :int16],
    [:unknown02,            [:unknown,1]], #only on human weapons
    [:icon_id,              :int8], #TODO: Test and document icon ids
    [:level,                :int8], #true, effective level
    [:item_world_level_max, :int8],
    [:unknown03,            [:unknown,2]], #all 0
    [:weapon_colour,        :int8], #actually used to control the colours (ie. legendary excalibur is red, value 3) normal = 1
    [:unknown04,            [:unknown,3]], #maybe int8s, related to item world levels? 3 = last bailiff level?
    [:item_world_level,     :int8], #how many item world levels cleared
    [:unknown05,            [:unknown,5]], #4 = lover spawn counter? 5 = lover spawned?
    [:rarity,               :int8],
    
    [:unknown06,            [:unknown,2]], #1 = (0x2 + 1), 2=weapon type? same values as WeaponMastery,7=red monster,21=blue monster
    [:population,           :int8],
    [:mv,                   :int8],
    [:jmp,                  :int8],
    [:item_rank,            :int8], #r39,r40. determines price, item world enemy level, etc.
    [:range,                :int8],
    [:unknown08,            [:unknown,1]],
    [:critical_chance,      :int8], #naturally lower for guns, higher for fists, red monster
    [:unknown11,            [:unknown,1]],
    [:rarity_badge,         :int8], #1=silver 'R', 2=gold 'L', 0=normal
    [:unknown09,            [:unknown,18]], #information on "More ATK" bills passed? Excalibur and Necronomicon both have #13 as 30 (3x 10, 3 bills passed?)
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,                 [:string,33]], 
    [:wtf_name,             [:disgaea_string,39]] #wtf, it has the name of (seemingly) random characters in here
  )
  
  ITEM_CLASS_IDS = {
    #fists
    105  => :beat_down,
    106  => :playful_punch,
    108  => :finger_snap,
    122  => :pata,
    128  => :bichwa,
    130  => :hell_strike,
    134  => :macho_fist,
    135  => :paradise_blow,
    137  => :"100_fists",
    
    #swords
    203  => :rapier,
    212  => :ninja_blade,
    218  => :falchion,
    222  => :damascus,
    224  => :executioner,
    227  => :sesshoumaru,
    228  => :kagero,
    231  => :dragon_buster,
    232  => :durandal,
    235  => :bushin_blade,
    236  => :muramasa,
    237  => :sunrise_sword,
    238  => :infernal_sword,
    239  => :excalibur,
    
    #spears
    316  => :daimyo_spear,
    317  => :carbon_spear,
    322  => :bloody_cross,
    324  => :elder_spear,
    327  => :triton_lance,
    328  => :primeval_spear,
    331  => :lucifers_spear,
    332  => :emerald_lance,
    333  => :bruenack,
    337  => :gaea_spear,
    338  => :beam_javelin,
    339  => :holy_longinus,
    
    #bows
    
    #guns
    
    #axes
    
    #staves
    
    #monster weapons
    831  => :death_wing,
    839  => :statans_motor,
    877  => :the_convict,
    887  => :chaos,
    
    #armour
    1035 => :metal_suit,
    1038 => :majin_armor,
    
    #belts
    1108 => :black_belt,
    1109 => :ubermensch,
    
    #orbs
    1301 => :common_orb,
    1309 => :chaos_orb,
    
    #glasses
    1409 => :destiny_lens,
    
    #muscles
    1508 => :world_muscle,
    1509 => :star_muscle,
    
    #weights
    1607 => :power_weight_z,
    
    #scrolls
    1702 => :scroll_sword,
    1707 => :scroll_staff,
    
    #special items?
    1853 => :postcard,
    
    #emblems
    1901 => :imperial_seal,
    1909 => :exodus
    
    #hp items
    2008 => :eclair,
    2009 => :shortcake,
    
    #sp items
    2018 => :bloody_mary,
    
    #hp/sp items
    2038 => :immortal_pill,
    2039 => :soma,
    
    2051 => :fairy_dust,
    
    2062 => :ramen,
    
    2071 => :angel_cake,
    2072 => :gold_bar,
    
    2081 => :bomb,
    2084 => :chloroform,
    
    2091 => :mana_potion_i,
    
    #hands
    2104 => :bandits_hand,
    2105 => :awesome_hand,
    
    2201 => :mr_gency_exit,
    
    2301 => :cell_phone, #TODO: Find out types
    
    2401 => :subpoena
  }
  
end
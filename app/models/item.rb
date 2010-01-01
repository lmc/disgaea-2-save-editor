class Item < BaseData
  include Structure
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  #SIZE = 256
  #7224 = start of name
  #7296 = end of item?
  
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
    
    #range? critical chance (fists are higher i think)?
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
    [:unknown09,            [:unknown,18]], #seems to just be 00, maybe placeholder for DisgaeaString as below?
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,                 [:string,33]], 
    [:unknown10,            [:unknown,39]]
  )
  
end
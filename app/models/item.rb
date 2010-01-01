class Item < BaseData
  include Structure
  attr_accessor :parent_position #so we know where we sit in the characters array
  
  #SIZE = 256
  #7224 = start of name
  #7296 = end of item?
  
  structure(
    [:specialists,          [Specialist,8]],
    [:unknown01,            [:unknown,8]],
    [:stats,                Stats],
    [:base_stats,           Stats],
    [:item_class_id,        :int16],
    [:unknown02,            [:unknown,2]],
    [:level,                :int8], #true, effective level
    [:item_world_level_max, :int8],
    [:unknown03,            [:unknown,2]],
    [:weapon_colour,        :int8], #actually used to control the colours (ie. legendary excalibur is red, value 3) normal = 1
    [:unknown04,            [:unknown,3]], #maybe int8s, related to item world levels?
    [:item_world_level,     :int8], #how many item world levels cleared
    [:unknown05,            [:unknown,5]],
    [:rarity,               :int8],
    
    #range? critical chance (fists are higher i think)?
    [:unknown06,            [:unknown,2]],
    [:population,           :int8],
    [:mv,                   :int8],
    [:jmp,                  :int8],
    [:unknown07,            [:unknown,1]], #icon ids? identical for all "angel's sandals", not for all swords? maybe duplicate entries?
    [:maybe_is_weapon,      :int8],
    [:unknown08,            [:unknown,3]],
    [:rarity_badge,          :int8], #1=silver 'R', 2=gold 'L', 0=normal
    [:unknown09,            [:unknown,18]], #seems to just be 00, maybe placeholder for DisgaeaString as below?
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,                 [:string,33]], 
    [:unknown10,            [:unknown,39]]
  )
  
end
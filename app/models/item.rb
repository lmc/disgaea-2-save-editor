class Item < BaseData
  include Structure
  
  structure(
    [:specialists,    Specialists],
    [:unknown01,      [:unknown,8]],
    [:stats,          Stats],
    [:base_stats,     Stats],
    [:item_class_id,  :int16],
#    [:unknown02,      [:unknown,16]],
    [:unknown02,      [:unknown,2]],
    [:displayed_level,:int8],
    #[:unknown03,      [:unknown,13]],
    [:unknown03,      [:unknown,3]],
    [:text_colour,    :int8], #3 = gold, #2 = green, 1 = normal
    [:unknown04,      [:unknown,9]],
    [:rarity,         :int8],
    [:unknown05,      [:unknown,29]],
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,           [:string,33]], 
    [:unknown06,      [:unknown,39]]
  )
  
end
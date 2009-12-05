class Item < BaseData
  include Structure
  
  structure(
    [:specialists,  Specialists],
    [:unknown01,    [:unknown,8]],
    [:stats,        Stats],
    [:base_stats,   Stats],
#    [:unknown02,    [:unknown,48]],
    [:unknown02,    [:unknown,18]],
    [:rarity,       :int8],
    [:unknown03,    [:unknown,29]],
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,         [:string,33]], 
    [:unknown04,    [:unknown,39]]
  )
  
end
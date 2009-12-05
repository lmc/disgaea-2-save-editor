class Item < BaseData
  include Structure
  
  structure(
    [:specialists,  Specialists],
    [:unknown01,    [:unknown,8]],
    [:stats,        Stats],
    [:unknown02,    [:unknown,80]],
    #FIXME?: You can rename items in the Item World, will that make this become
    #  a DisgaeaString instead of String?
    [:name,         [:string,33]], 
    [:unknown03,    [:unknown,39]]
  )
  
end
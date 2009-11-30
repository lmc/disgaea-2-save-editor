class Item < BaseData
  include Structure
  
  structure(
    [:specialists,  Specialists],
    [:unknown01,    [:unknown,120]],
    [:name,         [:string,33]],
    [:unknown02,    [:unknown,39]]
  )
  
end
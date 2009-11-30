class Item < BaseData
  include Structure
  
  structure(
    [:unknown01,    [:unknown,184]],
    [:name,         [:string,33]],
    [:unknown02,    [:unknown,39]]
  )
  
end
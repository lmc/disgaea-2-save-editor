class Specialist < BaseData
  include Structure
  
  #TRICKY STUFF:
  #Level is weird, a subdued specialist is marked by dividing by 2, then adding 10000
  #unsubdued, level 14  == 14
  #subdued, level 14    == 10007
  #unsubdued, level 242 == 242
  #subdued, level 242   == 10121
  structure(
    [:level,     :uint16],
    [:unknown,   :uint16],
    [:class_id,  :uint16],
    [:name_id,   :uint16]
  )
end
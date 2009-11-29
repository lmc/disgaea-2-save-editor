class Specialist < BaseData
  include Structure
  SIZE = 8
  
  structure(
    [:level,     :uint16],
    [:unknown,   :uint16],
    [:class,     :uint16],
    [:name_id,   :uint16]
  )
end
class WeaponSkills < BaseData
  include Structure
  
  structure(
    [:fist,   :int8],
    [:sword,  :int8],
    [:spear,  :int8],
    [:bow,    :int8],
    [:gun,    :int8],
    [:axe,    :int8],
    [:staff,  :int8]
  )

end
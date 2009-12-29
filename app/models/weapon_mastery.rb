class WeaponMastery < BaseData
  include Structure
  
  WEAPON_MASTERY_GRADES = {
    2..4   => :e,
    5..9   => :d,
    10..14 => :c,
    15..19 => :b,
    20..24 => :a,
    25..30 => :s
  }
  
  structure(
    [:fist,   :int8],
    [:sword,  :int8],
    [:spear,  :int8],
    [:bow,    :int8],
    [:gun,    :int8],
    [:axe,    :int8],
    [:staff,  :int8],
    [:padding,:int8] #seems to be 0 all the time
  )

end
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
  
  CLASS_IDS = {
    2    => 'Master',
    3    => 'Gladiator',
    5    => 'Tutor',
    6    => 'Coach',
    8    => 'Physician',
    21   => 'Alchemist',
    46   => 'Firefighter',
    63   => 'Manager',
    1118 => 'Rune Knight Lover',
    1119 => 'Female Samurai Lover',
  }
end
class Specialist < BaseData
  include Structure
  
  #TRICKY STUFF:
  #Level is weird, a subdued specialist is marked by dividing by 2, then adding 10000
  #unsubdued, level 14  == 14
  #subdued, level 14    == 10007
  #unsubdued, level 242 == 242
  #subdued, level 242   == 10121
  structure(
    [:raw_level, :uint16],
    [:unknown,   :uint16],
    [:class_id,  :uint16],
    [:name_id,   :uint16]
  )
  attr_accessor :level, :subdued
  alias_method :subdued?, :subdued
  
  def raw_level
    subdued? ? (level / 2) + 10000 : level
  end
  
  def raw_level=(new_level)
    new_level = new_level.value if new_level.respond_to?(:value)
    if new_level > 9999
      self.subdued = true
      self.level = (new_level - 10000) * 2
    else
      self.subdued = false
      self.level = new_level
    end
  end
  
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
  
  def class_name
    CLASS_IDS[class_id] || "Unknown #{class_id}"
  end
  
  def inspect
    "#<Specialist #{class_name} lvl. #{level} #{subdued? ? 'Subdued' : 'Unsubdued'}>"
  end
end
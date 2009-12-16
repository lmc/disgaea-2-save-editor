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
  
  #call after level=, set raw_level, multiply or not depending on subdued status
  #call after subdued=, multiply or divide based on old status
  def recalculate_level_and_subdued_status!
    
  end
  
  TYPE_EFFECT_LIMITS = {
    :stat    => 19998,
    :effect  => 100,
    :element => 99,
    :bonus   => 100,
    :lover   => 25
  }
  
  CLASS_IDS = {
    #specialist type(stat,resist,effect,bonus,lover), name
    1    => [[:stat,:hp],             'Dietician'], #test
    2    => [[:stat,:sp],             'Master'],
    3    => [[:stat,:atk],            'Gladiator'],
    4    => [[:stat,:def],            'Sentry'], #test
    5    => [[:stat,:int],            'Tutor'],
    6    => [[:stat,:spd],            'Coach'],
    8    => [[:stat,:res],            'Physician'],
    21   => [[:effect,:poison],       'Alchemist'],
    46   => [[:resist,:fire],         'Firefighter'],
    63   => ['Manager'],
    1118 => [[:lover,:rune_knight],'Rune Knight Lover'],
    1119 => [[:lover,:female_samurai],'Female Samurai Lover']
  }
  
  def class_name
    CLASS_IDS[class_id] || "Unknown #{class_id}"
  end
  
  def inspect
    "#<Specialist #{class_name} lvl. #{level} #{subdued? ? 'Subdued' : 'Unsubdued'}>"
  end
end
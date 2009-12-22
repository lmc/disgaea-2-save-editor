class WeaponSkill
  attr_accessor :weapon_skills, :index
  attr_accessor :skill, :exp, :level
  
  def initialize(weapon_skills,index)
    self.weapon_skills,self.index = weapon_skills,index
  end
  
  def skill_name
    skill_stats[:name]
  end
  
  def skill_stats
    stats = WEAPON_SKILLS[skill]
    {
      :weapon_type => stats[0],
      :skill_class => stats[1],
      :name        => stats[2]
    }
  end
  
  WEAPON_SKILLS = [
    201  => [:sword,nil,'Blade Rush'],
    202  => [:sword,nil,'Hurricane Slash'],
    203  => [:sword,nil,'Moon Slash'],
    204  => [:sword,nil,'Winged Slayer'],
    205  => [:sword,nil,'Dark X Slash'],
    206  => [:sword,nil,'Dimension Slash'],
    207  => [:sword,nil,'Ultra Overlord'],
    
    301  => [:spear,nil,'Impaler'],
    302  => [:spear,nil,'Lightning Spear'],
    303  => [:spear,nil,'Asteroid Drop'],
    
    401  => [:bow,  nil,'Poison Blast'],
    402  => [:bow,  nil,'Raiden Missle'],
    403  => [:bow,  nil,'Delta Split'],
    
    #Most specials for certain characters will look weird with other characters due to missing
    #animation frames
    1011 => [:special,:adell,'Crimson Flame'],
    1012 => [:special,:adell,'Soaring Fire'],
    1013 => [:special,:adell,'Vulcan Blaze'],
    
    1021 => [:special,:rozalin,'Rose Thorns'],
    1022 => [:special,:rozalin,'Kneel Before Me'],
    1023 => [:special,:rozalin,'Rose Liberation'],
    
    1031 => [:special,:axel,'Shocking Soul'],
    1032 => [:special,:axel,'My Heart Shakes'],
    1033 => [:special,:axel,'Love Dynamite'],
    
    1041 => [:special,:etna,'Prinny Raid'],
    1042 => [:special,:etna,'Sexy Beam'],
    1043 => [:special,:etna,'Chaos Impact'],
    
    1051 => [:special,:yukimaru,'Nadarejin'],
    
    #NOTE: Assigning bad weapon_skill values will hard-lock the PSP when you go to use the character
    #in battle. The skills will not been shown on the status screens outside of battle.
    #Some of these are bad
    #1052
    #1053
    #1061
    #1062
    #1063
    #1071
    #1072
    
    2125 => [:special,:mothman,'Mothman Shot'],
    2121 => [:special,:mothman,'Hell Pollen'],
    2122 => [:special,:mothman,'Bug Hypnosis'],
    2123 => [:special,:mothman,'Ultra Sound'],
    2124 => [:special,:mothman,'Tornado Dive'],
    2126 => [:special,:mothman,'Mothman Go'],
    
    
  ]
  
end
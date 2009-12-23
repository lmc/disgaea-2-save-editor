class WeaponSkill
  attr_accessor :weapon_skills, :index
  attr_accessor :skill, :exp, :level
  
  def initialize(weapon_skills,index)
    self.weapon_skills,self.index = weapon_skills,index
  end
  
  def skill_name
    skill_stats[:name] || "Unknown (#{skill})"
  end
  
  def skill_stats
    stats = WEAPON_SKILLS[skill]
    {
      :weapon_type => stats[0],
      :skill_class => stats[1],
      :name        => stats[2]
    }
  rescue
    {
      :weapon_type => nil,
      :skill_class => nil,
      :name        => nil
    }
  end
  
  WEAPON_SKILLS = {
    101  => [:fist, nil,'Triple Strike'],
    102  => [:fist, nil,'Tiger Charge'],
    103  => [:fist, nil,'Lion\'s Roar'],
    104  => [:fist, nil,'Tiger Charge'],
    
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
    
    501  => [:gun,  nil,'Tri-Burst'],
    502  => [:gun,  nil,'Gaia Blast'],
    503  => [:gun,  nil,'Proximal Shot'],
    
    701  => [:magic,:fire,'Fire'],
    702  => [:magic,:fire,'Mega Fire'],
    703  => [:magic,:fire,'Giga Fire'],
    704  => [:magic,:fire,'Omega Fire'],
    705  => [:magic,:fire,'Tera Fire'],
    706  => [:magic,:fire,'Peta Fire'],
    
    721  => [:magic,:fire,'Ice'],
    722  => [:magic,:fire,'Mega Ice'],
    723  => [:magic,:fire,'Giga Ice'],
    724  => [:magic,:fire,'Omega Ice'],
    725  => [:magic,:fire,'Tera Ice'],
    726  => [:magic,:fire,'Peta Ice'],
        
    731  => [:magic,:star,'Star'],
    732  => [:magic,:star,'Mega Star'],
    733  => [:magic,:star,'Giga Star'],
    734  => [:magic,:star,'Omega Star'],
    735  => [:magic,:star,'Tera Star'],
    736  => [:magic,:star,'Peta Star'],
    
    801  => [:magic,:buff,'Heal'],
    802  => [:magic,:buff,'Mega Heal'],
    803  => [:magic,:buff,'Giga Heal'],
    804  => [:magic,:buff,'Omega Heal'],
    805  => [:magic,:buff,'Tera Heal'], #check, maybe espoir instead?
    
    811  => [:magic,:buff,'Braveheart'],
    812  => [:magic,:buff,'Shield'], #check
    813  => [:magic,:buff,'Magic Boost'], #check
    
    817  => [:magic,:drain,'Enfeeble'],
    818  => [:magic,:drain,'Armor Break'],
    820  => [:magic,:drain,'Slow'],
    821  => [:magic,:drain,'Resist Break'],
    
    901  => [:special,:geomaster,'Geo Change'],
    905  => [:special,:geomaster,'Geo Blast'],
    906  => [:special,:geomaster,'Geo Warp'],
    
    921  => [:magic,:buff,'Fire Weapon'], #check
    924  => [:magic,:buff,'Fire Charge'], #check
    
    931  => [:special,:thief,'Health'],
    932  => [:special,:thief,'Consciousness'],
    933  => [:special,:thief,'Freedom'],
    934  => [:special,:thief,'Memory'],
    
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
    1052 => [:special,:yukimaru,'Setsugetsuka'],
    
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
    
    1101 => [:special,:taro,'Milk'],
    1105 => [:magichange,:taro,'Milk Splash'],
    
    1111 => [:special,:hanako,'Song of Hope'],
    1111 => [:magichange,:hanako,'It\'s A Vase'],
    
    1121 => [:special,:tink,'Kero Change!'],
    1122 => [:special,:tink,'Sonic Roll'],
    1125 => [:magichange,:tink,'Gutsy Tink'],
    
    1301 => [:special,:raspberyl,'D-Rule 1: Morality'],
    1302 => [:special,:raspberyl,'D-Rule 2: Volunteer'],
    1303 => [:special,:raspberyl,'D-Rule 3: EcoFriend'],
    1305 => [:magichange,:raspberyl,'Imperial Cross'],
    1306 => [:magichange,:raspberyl,'Delta Extreme'],
    
    1311 => [:special,:mr_champloo,'Shredder Kick'],
    1312 => [:special,:mr_champloo,'Chef\'s Special'],
    1313 => [:special,:mr_champloo,'Flaming Stir-Fry'],
    
    2071 => [:special,:prinny,'Prinny Barrage'],
    2072 => [:special,:prinny,'Prinny Dance'],
    2073 => [:special,:prinny,'Prinny Bomb'],
    2074 => [:special,:prinny,'Pringer Beam'],
    2075 => [:magichange,:prinny,'Panic Laser'],
    2076 => [:magichange,:prinny,'Prinnical Shock'],
    
    2121 => [:special,:mothman,'Hell Pollen'],
    2122 => [:special,:mothman,'Bug Hypnosis'],
    2123 => [:special,:mothman,'Ultra Sound'],
    2124 => [:special,:mothman,'Tornado Dive'],
    2125 => [:magichange,:mothman,'Mothman Shot'],
    2126 => [:magichange,:mothman,'Mothman Go'],
    
    
  }
  
end
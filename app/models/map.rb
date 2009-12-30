class Map < BaseData
  include Structure
  #strc.maps.each { |m| puts [m.times_cleared,m.killed,m.map_id,m.bonus_rank,m.unknown01,m.unknown02,m.unknown03,m.unknown04].join("\t") }
  structure(
    [:times_cleared,:int16],
    [:killed,       :int16],
    [:map_id,       :int16],
    [:bonus_rank,   :int16],
    [:unknown01,   :int8], #always 1
    [:unknown02,   :int8], #cutscene id?
    [:unknown03,   :int16], #always 0
    [:unknown04,   :int16], #always 0
    [:unknown05,   :int8], #is a dark world version?
    [:unknown06,   :int8] 
  )
  
  MAP_TITLES = {
    501 => ['Cavern of Evil',"Glutton's Hideout"],
    503 => ['Cavern of Evil',"Shriek of Death"],
    
    601 => ['Battle Arena','First Battle'],
    
    801 => ['Colosseum Depths','Hades Corridor'],
    
    901 => ['Alche City','Dead Metropolis'],
    902 => ['Alche City','Grave of Alchemy'],
    903 => ['Alche City','Altered Town'],
    903 => ['Alche City','Snarling Capital']
  }
  
end
class Character
  module ClassIds
  end
  
  #FIXME: Find out 'official' names (game uses rank 1 names, not proper class names)
  CLASS_IDS = {
    1  => :adell,
    2  => :rozalin,
    
    12 => :tink,
    11 => :hanako,
    
    26 => :raspberyl,
    
    40 => :fighter,
    41 => :lady_fighter,
    43 => :mage,
    44 => :lady_mage,
    45 => :ninja,#
    46 => :lady_ninja,#
    47 => :maijin, #
    48 => :heavy_knight,#
    49 => :sinnner, #
    50 => :geomancer, #
    51 => :samurai,
    52 => :gunner, #
    53 => :thief,
    54 => :healer,
    55 => :archer, #
    56 => :beast_tamer, #
    57 => :magic_knight,
    58 => :lady_samurai
  }
  
  def self.class_id_to_symbol(class_id)
    CLASS_IDS[class_id]
  end
  
  def class_symbol
    self.class.class_id_to_symbol(self.class_id)
  end
  
end
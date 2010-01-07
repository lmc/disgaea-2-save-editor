class Character
  module ExpRates
  end
  
  CHARACTER_EXP_RATES = {
    :adell        => 5,
    :rozalin      => 5,
    :tink         => 3,
    :hanako       => 3,
    :yukimaru     => 5,
    :etna         => 5,
    :flonne       => 5,
    :laharl       => 5,
    :axel         => 5,
    :fubuki       => 5,
    :kurtis       => 5,
    :fighter      => 4,
    :lady_fighter => 4,
    :mage         => 4,
    :lady_mage    => 4,
    :ninja        => 6,
    :lady_ninja   => 6,
    :maijin       => 9,
    :heavy_knight => 5,
    :sinner       => 5,
    :geomancer    => 5,
    :samurai      => 6,
    :gunner       => 6,
    :thief        => 4,
    :healer       => 4,
    :archer       => 6,
    :beast_tamer  => 5,
    :rune_knight  => 5
  }
  DEFAULT_CHARACTER_EXP_RATE = 5
  
  def exp_rate
    CHARACTER_EXP_RATES[class_symbol] || DEFAULT_CHARACTER_EXP_RATE
  end
end
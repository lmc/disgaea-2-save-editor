#Fire/Wind/Ice resistance for characters and items
class ElementalStats < BaseData
  include Structure

  structure(
    [:fire,  :uint8],
    [:wind,  :uint8],
    [:ice,   :uint8]
  )
end
#Effect bonuses/resistances
class EffectStats < BaseData
  include Structure

  structure(
    [:poison,   :uint16],
    [:sleep,    :uint16],
    [:deprave,  :uint16],
    [:forget,   :uint16],
    [:paralyze, :uint16]
  )
end
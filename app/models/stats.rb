class Stats < BaseData
  include Structure

  structure(
    [:hp,  :uint32],
    [:sp,  :uint32],
    [:atk, :uint32],
    [:def, :uint32],
    [:int, :uint32],
    [:spd, :uint32],
    [:hit, :uint32],
    [:res, :uint32]
  )
end
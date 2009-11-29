class Stats < BaseData
  include Structure

  structure(
    [:hp,  :int32],
    [:sp,  :int32],
    [:atk, :int32],
    [:def, :int32],
    [:int, :int32],
    [:spd, :int32],
    [:hit, :int32],
    [:res, :int32]
  )
end
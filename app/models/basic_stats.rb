#The 'Basic stats' from the character creation screen.
class BasicStats < BaseData
  include Structure

  structure(
    [:hp,  :int8],
    [:sp,  :int8],
    [:atk, :int8],
    [:def, :int8],
    [:int, :int8],
    [:spd, :int8],
    [:hit, :int8],
    [:res, :int8]
  )
end
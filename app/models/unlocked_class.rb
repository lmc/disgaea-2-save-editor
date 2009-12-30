class UnlockedClass < BaseData
  include Structure

  structure(
    [:killed,   :int16],
    [:unknown01,:int8],
    [:unknown02,:int8],
    [:unknown03,:int8],
    [:unknown04,:int8],
    [:unknown05,:int8],
    [:unknown06,:int8] #all 0
  )
end
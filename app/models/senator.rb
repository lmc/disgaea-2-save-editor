class Senator < BaseData
  include Structure
  
  structure(
    [:level,        :int16],
    [:senator_id,   :int16],
    [:attendence,   :int16],
    [:killed,       :int16],
    [:unknown01,    [:unknown,3]],
    [:magic_number, :int8],
    [:unknown02,    [:unknown,2]],
    [:name,         [:string,31]],
    [:attitude,     :int8]
  )
  
end
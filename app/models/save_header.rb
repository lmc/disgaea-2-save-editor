class SaveHeader
  structure(
    [:checksum_maybe, [:int8,8]],
    [:timestamp,      :time_stamp],
    [:unknown01,      :int8],
    [:name,           [:string,31]],
    [:level,          :int16],
    [:unknown02,      :int16],
    [:chapter,        :int16]
  )
end
class SaveHeader < BaseData
  include Structure
  structure(
    [:checksum_maybe, [:int8,8]],
    [:timestamp,      :time_stamp],
    [:unknown01,      :int8],
    [:name,           [:string,31]],
    [:level,          :int16],
    [:unknown02,      :int16],
    [:chapter,        :int8] #HACK?: akurasu docs says int16 but mine has a mystery 03 byte after, making it 777
  )
  
  def disassemble(file)
    file.seek(0)
    super(file)
  end
end
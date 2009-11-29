class SaveHeader < BaseData
  include Structure
  structure(
    [:checksum_maybe, [:int8,8]],
    [:timestamp,      :time_stamp],
    [:unknown01,      :int8],
    [:name,           [:string,31]],
    [:level,          :int16],
    [:unknown02,      :int16],
    [:chapter,        :int16]
  )
  
  def disassemble(file)
    file.seek(0)
    super(file)
  end
end
class BaseData::Uint16 < BaseData::Int16
  def self.limits; -32768..32767; end
end
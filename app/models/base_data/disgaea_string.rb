#Some strings are stored as plain-text, others are in this weird offset form @__@
require 'base_data/string' #HACK: Stop ruby getting confused and thinking we want ::String
class BaseData::DisgaeaString < BaseData::String
  TRANSLATIONS = {
    64  => ' ',
    70  => ':'
  }
  
  def self.translate_char(disgaea_char)
    case disgaea_char[0].ord #first character's numeral
    when 130 #0x82
      chr = disgaea_char[1]
      chr -= 1 if chr > 128
      (chr - 31).chr
    when 129
      TRANSLATIONS[disgaea_char[1]] || disgaea_char
    else
      "\000"
    end
  end
  
  def self.translate(disgaea_string)
    disgaea_string.bytes.to_a.map(&:chr).in_groups_of(2).map do |*int16|
      translate_char(int16.join)
    end.join
  end
  
  
end
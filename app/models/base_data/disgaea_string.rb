#Some strings are stored as plain-text, others are in this weird offset form @__@
require 'base_data/string' #HACK: Stop ruby getting confused and thinking we want ::String
class BaseData::DisgaeaString < BaseData::String
  ASCI_TO_DISGAEA_OFFSET = 31
  MAGIC_BUMP_NUMBER = 128
  
  TRANSLATIONS = {
    64  => ' ',
    70  => ':'
  }
  
  def self.translate_char(disgaea_char)
    case disgaea_char[0].ord #first character's numeral
    when 130 #0x82
      chr = disgaea_char[1]
      chr -= 1 if chr > MAGIC_BUMP_NUMBER
      (chr - ASCI_TO_DISGAEA_OFFSET).chr
    when 129
      TRANSLATIONS[disgaea_char[1]] || disgaea_char
    else
      "\000"
    end
  end
  
  def self.untranslate_char(char)
    if char =~ /[a-zA-Z]/
      code  = char.ord
      code += 1 if code > (MAGIC_BUMP_NUMBER - ASCI_TO_DISGAEA_OFFSET)
      code += ASCI_TO_DISGAEA_OFFSET
      [130.chr,code.chr].join
    elsif TRANSLATIONS.values.include?(char)
      [129.chr,TRANSLATIONS.index(char),chr].join
    else
      "\000\000"
    end
  end
  
  def self.translate(disgaea_string)
    disgaea_string.bytes.to_a.map(&:chr).in_groups_of(2).map do |*int16|
      translate_char(int16.join)
    end.join
  end
  
  def self.untranslate(string)
    string.bytes.to_a.map(&:chr).map do |char|
      untranslate_char(char)
    end
  end
  
  
end
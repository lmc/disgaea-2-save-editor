#TODO: Make this into an instance-able class, with accessor blocks for skipping, highlighting, sorting, etc.

#To compare 3 character's tunknown blocks as int16s
#  chars = Save.new.disassemble.characters
#  comp = Compare.new(chars[0],chars[1],chars[2])
#  comp.map = [:tunknown,:as_int16]
#  comp.compare_string
class Compare
  attr_accessor :to_compare
  attr_accessor :sorter
  attr_accessor :map
  attr_accessor :skip_if
  attr_accessor :highlight_if
  attr_accessor :display
  
  FALSE_PROC = proc { |idx,*args| false }
  DISPLAY_PROC = proc { |idx,*args| [idx,args].flatten.join("\t") }
  
  def initialize(*to_compare)
    self.to_compare = [to_compare].flatten
    self.map = []
    
    self.map += [:tunknown,:as_int16]
  end
  
  def skip?(*args)
    (self.skip_if || FALSE_PROC).call(*args)
  end
  
  def highlight?(*args)
    (self.highlight_if || FALSE_PROC).call(*args)
  end
  
  def compare_items(*args)
    (self.display || DISPLAY_PROC).call(*args)
  end
  
  def compare
    items = to_compare
    map.each do |method|
      items = items.map(&method)
    end
    max_count = items.map(&:size).max
    results = []
    max_count.times do |index|
      this_row = [index]
      items.size.times do |column|
        this_row << items[column][index]
      end
      results << compare_items(*this_row)
    end
    results
  end
  
  def compare_string
    compare.each do |compare_result|
      puts compare_result
    end
    nil
  end
  
end
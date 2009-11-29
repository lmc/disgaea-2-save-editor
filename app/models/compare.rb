#TODO: Make this into an instance-able class, with accessor blocks for skipping, highlighting, sorting, etc.
class Compare
  
  VALUEIZER = proc { |obj| obj.respond_to?(:value) ? obj.value : obj }
  
  def self.comp(values1,values2,options = {},&block)
    values1 = values1.map(&VALUEIZER) if values1.respond_to?(:map)
    values2 = values2.map(&VALUEIZER) if values2.respond_to?(:map)
    block ||= proc { |u1,u2,idx| "#{idx}:\t#{u1}\t#{u2}" }
    
    options.reverse_merge!(
      :skip_unless => proc { |u1,u2,idx| false }
    )
    
    [values1.size,values2.size].max.times do |line|
      args = [values1[line],values2[line],line]
      next unless options[:skip_unless].call(*args)
      puts block.call(*args)
    end
  end
  
  #s = Save.new.disassemble.characters
  #compare two character's stats (at indexes 0 and 1)
  #Compare.comp_array(s,0,1,:map => [:stats,:comp_values]) { |(k,u1),(k,u2)| "#{u1}\t#{k}\t#{u2}" }
  #compare two character's unknown03 blocks
  #Compare.comp_array(.,0,1,:map => [:unknown03])
  #find interesting values
  #Compare.comp_array(s,0,1,:map => [:unknown02],:skip_unless => proc {|u1,u2,idx| (u1 > 0 || u2 > 0) })
  #find interesting differences
  #Compare.comp_array(s,0,1,:map => [:unknown01],:skip_unless => proc {|u1,u2,idx| (u1 > 0 || u2 > 0) && (u1 != u2) })
  def self.comp_array(array,*args,&block)
    options = args.extract_options!
    options.reverse_merge!(
      :map => nil
    )
    items = args.inject([]) do |items,index|
      item = array[index]
      if options[:map]
        [options[:map]].flatten.each do |method|
          item = item.send(method) 
        end
      end
      items << item
      items
    end
    comp(items[0],items[1],options,&block)
  end
  
end
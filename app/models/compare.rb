class Compare
  
  VALUEIZER = proc { |obj| obj.respond_to?(:value) ? obj.value : obj }
  
  def self.comp(values1,values2,&block)
    values1 = values1.map(&VALUEIZER) if values1.respond_to?(:map)
    values2 = values2.map(&VALUEIZER) if values2.respond_to?(:map)
    block ||= proc { |u1,u2,idx| "#{idx}:\t#{u1}\t#{u2}" }
    
    [values1.size,values2.size].max.times do |line|
      puts block.call(values1[line],values2[line],line)
    end
  end
  
  #compare two character's stats (at indexes 0 and 1)
  #Compare.comp_array(s.characters,0,1,:map => [:stats,:comp_values]) { |(k,u1),(k,u2)| "#{u1}\t#{k}\t#{u2}" }
  #compare two character's unknown03 blocks
  #Compare.comp_array(s.characters,0,1,:map => [:unknown03])
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
    comp(items[0],items[1],&block)
  end
  
end
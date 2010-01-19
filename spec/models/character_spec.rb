require File.dirname(__FILE__) + '/../spec_helper'

describe Character do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/character.bin')
    @character = Character.new
  end
  
  def disassembled
    @disassembled ||= @character.disassemble(@file)
    @disassembled
  end
  
  it "should disassemble" do
    disassembled.should be_an_instance_of Character
  end
  
  it "should assemble" do
    @output = ""
    assembled = disassembled.assemble(@output)
    #we have this really weird thing related to the fact the game doesn't clear out strings in saves
    #even though the assembled file is perfectly usable, it's not byte-for-byte identical
    #so we'll assemble and disassemble it twice
    @output = ""
    assembled = String.new(assembled)
    chr = Character.new.disassemble("#{assembled}")
    #debugger
    
    assembled = chr.assemble(@output)
    
    assembled.size.should == 3072
    assembled.should == @file.tap { |f| f.rewind }.read
  end
  
  it "should extract experience" do
    disassembled.experience_struct.should be_an_instance_of BaseData::Uint64
    disassembled.experience.should == 1469552283
  end
  
  it "should calculate level from experience"
  
  it "should extract items" do
    disassembled.should have(4).items
    disassembled.items[0].name.strip.should == 'Balmung'
    disassembled.items[1].name.strip.should == 'Arcadia'
    disassembled.items[2].name.strip.should == "Angel's Sandals"
    disassembled.items[3].name.strip.should == "Felicitation"
  end
  
  it "should extract character name" do
    disassembled.name_struct.should be_an_instance_of BaseData::DisgaeaStringCollection
    disassembled.name_struct.size.should equal 41
    disassembled.name.strip.should == 'Kyoko'
  end
  
  it "should extract class name" do
    disassembled.class_name_struct.should be_an_instance_of BaseData::StringCollection
    disassembled.class_name_struct.size.should equal 61
    #MYSTERY: Most specs say it should be 61 character longs, but I have a 0E just chilling in the middle of my string
    #"Exorcist\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000
    #\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
    #disassembled.class_name.strip.should == 'Exorcist'
  end
  
  it "should extract element stats" do
    disassembled.element_stats_struct.should be_an_instance_of ElementalStats
    disassembled.element_stats.fire.should == 50
    disassembled.element_stats.wind.should == 0
    disassembled.element_stats.ice.should  == -50
  end
  
  it "should extract base element stats" do
    disassembled.base_element_stats_struct.should be_an_instance_of ElementalStats
    disassembled.base_element_stats.fire.should == 50
    disassembled.base_element_stats.wind.should == 0
    disassembled.base_element_stats.ice.should  == -50
  end
  
  it "should extract skill experience"
  
  it "should extract skills"
  
  it "should extract current HP" do
    disassembled.current_hp_struct.should be_an_instance_of BaseData::Int32
    disassembled.current_hp.should == 48728
  end
  
  it "should extract current SP" do
    disassembled.current_sp_struct.should be_an_instance_of BaseData::Int32
    disassembled.current_sp.should == 14822
  end
  
  it "should extract stats" do
    disassembled.stats_struct.should be_an_instance_of Stats
    disassembled.stats.hp.should equal 77142
    disassembled.stats.sp.should equal 16053
    disassembled.stats.atk.should equal 60494
    disassembled.stats.def.should equal 19316
    disassembled.stats.int.should equal 17494
    disassembled.stats.res.should equal 13795
    disassembled.stats.hit.should equal 22134
    disassembled.stats.spd.should equal 25808
  end
  
  it "should extract naked stats" do
    disassembled.naked_stats_struct.should be_an_instance_of Stats
    disassembled.naked_stats.hp.should == 10294
    disassembled.naked_stats.sp.should == 3420
    disassembled.naked_stats.atk.should == 10317
    disassembled.naked_stats.def.should == 4553
    disassembled.naked_stats.int.should == 4566
    disassembled.naked_stats.res.should == 3418
    disassembled.naked_stats.hit.should == 6837
    disassembled.naked_stats.spd.should == 7402
  end
  
  it "should extract current hp and sp" do
    disassembled.current_hp.should == 48728
    disassembled.current_sp.should == 14822
  end
  
  it "should extract mana" do
    disassembled.mana_struct.should be_an_instance_of BaseData::Uint32
    disassembled.mana.should equal 801740
  end
  
  it "should extract total felonies" do
    disassembled.felonies_total_struct.should be_an_instance_of BaseData::Int16
    disassembled.felonies_total.should equal 133
  end
  
  it "should extract displayed felonies" do
    disassembled.felonies_displayed_struct.should be_an_instance_of BaseData::Int16
    disassembled.felonies_displayed.should equal 99
  end
  
  it "should extract jmp" do
    disassembled.base_jmp_struct.should be_an_instance_of BaseData::Int8
    disassembled.base_jmp.should == 20
    disassembled.jmp_struct.should be_an_instance_of BaseData::Int8
    disassembled.jmp.should == 45
  end
  
  it "should extract mv" do
    disassembled.base_mv_struct.should be_an_instance_of BaseData::Int8
    disassembled.base_mv.should == 5
    disassembled.mv_struct.should be_an_instance_of BaseData::Int8
    disassembled.mv.should == 9
  end
  
  it "should extract counter" do
    disassembled.base_counter_struct.should be_an_instance_of BaseData::Int8
    disassembled.base_counter.should == 2
    disassembled.counter_struct.should be_an_instance_of BaseData::Int8
    disassembled.counter.should == 2
  end

end
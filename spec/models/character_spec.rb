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
  
  it "should extract experience" do
    disassembled.experience_struct.should be_an_instance_of BaseData::Uint64
    disassembled.experience.should == 1469552283
  end
  
  it "should extract items" do
    disassembled.should have(4).items
    disassembled.items[0].name.strip.should == 'Balmung'
    disassembled.items[1].name.strip.should == 'Arcadia'
    disassembled.items[2].name.strip.should == "Angel's Sandals"
    disassembled.items[3].name.strip.should == "Felicitation"
    
    #TODO: Put these in own spec
    
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
  
  it "should extract resistances"
  
  it "should extract skill experience"
  
  it "should extract skills"
  
  it "should extract current HP"
  
  it "should extract current SP"
  
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

end
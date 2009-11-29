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
  
  def stats
    disassembled.stats
  end
  
  it "should disassemble" do
    disassembled.should be_an_instance_of Character
  end
  
  it "should extract experience" do
    disassembled.experience.should be_an_instance_of BaseData::Uint64
    disassembled.experience.value.should == 1469552283
  end
  
  it "should extract items"
  
  it "should extract character name"
  
  it "should extract class name"
  
  it "should extract resistances"
  
  it "should extract skill experience"
  
  it "should extract skills"
  
  it "should extract current HP"
  
  it "should extract current SP"
  
  it "should extract stats" do
    stats.should be_an_instance_of Stats
    stats.hp.value.should equal 77142
    stats.sp.value.should equal 16053
    stats.atk.value.should equal 60494
    stats.def.value.should equal 19316
    stats.int.value.should equal 17494
    stats.res.value.should equal 13795
    stats.hit.value.should equal 22134
    stats.spd.value.should equal 25808
  end
  
  it "should extract mana" do
    disassembled.mana.should be_an_instance_of BaseData::Uint32
    disassembled.mana.value.should equal 801740
  end

end
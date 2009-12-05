require File.dirname(__FILE__) + '/../spec_helper'

describe Item do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/character.bin')
    @item = Save.new.disassemble.characters[0].items[0]
  end
  
  it "should disassemble" do
    @item.should be_an_instance_of Item
  end
  
  it "should have specialists" do
    @item.specialists.should be_an_instance_of Specialists
    @item.should have(8).specialists
  end
  
  it "should extract name" do
    @item.name_struct.should be_an_instance_of BaseData::StringCollection
    @item.name_struct.size.should equal 33
    @item.name.strip.should == 'Balmung'
  end
  
  it "should extract stats" do
    @item.stats_struct.should be_an_instance_of Stats
    @item.stats.hp.should equal 0
    @item.stats.sp.should equal 874
    @item.stats.atk.should equal 3487
    @item.stats.def.should equal 525
    @item.stats.int.should equal 0
    @item.stats.res.should equal 0
    @item.stats.hit.should equal 0
    @item.stats.spd.should equal 127
  end

end
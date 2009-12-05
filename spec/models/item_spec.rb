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
  
  it "should extract base stats" do
    @item.base_stats_struct.should be_an_instance_of Stats
  end
  
  it "should extract rarity" do
    @item.rarity_struct.should be_an_instance_of BaseData::Int8
    @item.rarity.should == 15
  end
  
  it "should extract item class id" do
    @item.item_class_id_struct.should be_an_instance_of BaseData::Int16
    @item.item_class_id.should == 233
  end
  
  it "should extract level" do
    @item.level_struct.should be_an_instance_of BaseData::Int8
    @item.level.should == 30
  end
  
  it "should extract text colour" do
    @item.text_colour_struct.should be_an_instance_of BaseData::Int8
    @item.text_colour.should == 2
  end
  
  it "should extract max item world level" do
    @item.item_world_level_max_struct.should be_an_instance_of BaseData::Int8
    @item.item_world_level_max.should == 59
  end
  
  it "should extract item world level" do
    @item.item_world_level_struct.should be_an_instance_of BaseData::Int8
    @item.item_world_level.should == 30
  end
  
end
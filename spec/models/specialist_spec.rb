require File.dirname(__FILE__) + '/../spec_helper'

describe Specialist do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/full_save.bin')
    @specialist = Save.new.disassemble.characters[0].items[0].specialists[0]
  end
  
  it "should disassemble" do
    @specialist.should be_an_instance_of Specialist
  end
  
  it "should know class name" do
    @specialist.class_id.should == 21
    @specialist.class_name.should == "Alchemist"
  end
  
  it "should correctly calculate level on subdued specialists" do
    @specialist.should be_subdued
    @specialist.raw_level.should == 10007
    @specialist.level.should == 14
  end
  
  
end
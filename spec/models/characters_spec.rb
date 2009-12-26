require File.dirname(__FILE__) + '/../spec_helper'

describe 'Characters' do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/full_save.bin')
  end
  
  def disassembled
    @disassembled ||= SaveStructure.new.disassemble(@file).characters
    @disassembled
  end
  
  it "should disassemble" do
    #disassembled.should have(16).entries
    disassembled.first.should be_an_instance_of Character
  end
  
  #lets just check 1st/2nd character's experience as a sanity check here
  it "should disassemble correctly" do
    disassembled.first.experience.should == 1469552283
    disassembled.second.experience.should == 978368200
  end
  
end
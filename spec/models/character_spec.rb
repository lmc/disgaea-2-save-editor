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
    disassembled.experience.should be_an_instance_of BaseData::Uint32
    disassembled.experience.value.should equal 1469552283
  end
  
  it "should extract items"
  
  it "should extract character name"
  
  it "should extract class name"
  
  it "should extract resistances"
  
  it "should extract skill experience"
  
  it "should extract skills"
  
  it "should extract current HP"
  
  it "should extract current SP"
  
  it "should extract stats"
  
  it "should extract mana"

end
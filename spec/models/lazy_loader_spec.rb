require File.dirname(__FILE__) + '/../spec_helper'

describe LazyLoader do
  
  before do
    @file = RAILS_ROOT+'/spec/fixtures/full_save.bin'
    @save = Save.new(@file)
  end
  
  it "should lazily load structures" do
    @save.structures.characters[0].should be_an_instance_of LazyLoader    
    @save.structures.characters[0].struct_class.should == Character    
    @save.structures.characters[0].name.strip.should == "Kyoko"
    @save.structures.characters[0].should be_an_instance_of Character
    @save.file.should_not be_eof
  end
  
  
end
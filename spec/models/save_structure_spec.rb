require File.dirname(__FILE__) + '/../spec_helper'

describe Character do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/full_save.bin')
    @save_structure = SaveStructure.new
  end
  
  def disassembled
    @disassembled ||= @save_structure.disassemble(@file)
    @disassembled
  end
  
  it "should disassemble" do
    #disassembled.should be_an_instance_of SaveStructure
  end
  
=begin
  it "should assemble" do
    @output = ""
    assembled = disassembled.assemble(@output)
    
    #peek = 0..10240
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    
    #peek = 10240..20480
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    
    #peek = 13460..13510
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    #peek = 13510..13560
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    #peek = 14360..13560
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    #
    peek = 1..-1
    assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    #
    #peek = 15360..17680
    #assembled[peek].should == @file.tap { |f| f.rewind }.read[peek]
    
    #FIXME: Things are breaking due to the story characters having weird name storage
    
    assembled.size.should == 546360
  end
=end

end
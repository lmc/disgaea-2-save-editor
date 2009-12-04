require File.dirname(__FILE__) + '/../spec_helper'

describe Compare do
  
  before do
    @file = File.open(RAILS_ROOT+'/spec/fixtures/full_save.bin')
  end
  
  def plain_data
    [
      [1,2,3,4],
      [5,6,7,8]
    ]
  end
  
  it "should compare" do
    comparer = Compare.new(*plain_data)
    comparer.should have(2).to_compare
    comparer.should have(4).compare #4, because that's how many things we're comparing
    comparer.compare.first.should == "0\t1\t5"
  end
  
  it "should compare and generate custom output"
  
  it "should compare and skip based on a :skip_if proc"
  
  it "should compare and highlight based on a :highlight_if proc"
  
  it "should compare and sort results"
  
  it "should generate headers for each compare column"
  
end
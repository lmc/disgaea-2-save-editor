require File.dirname(__FILE__) + '/../spec_helper'

describe BaseData do
  
  def base_data_instance(klass,value = nil)
    instance = "BaseData::#{klass.to_s.classify}".constantize.new
    instance.value = value
    instance
  end
  
  it "should disassemble ints" do
    base_data_instance(:int8).disassemble(bytes(1)).should == 1
    base_data_instance(:int16).disassemble(bytes(1,1)).should == 257
    base_data_instance(:int32).disassemble(bytes(1,1,1,1)).should == 16843009
    
    base_data_instance(:uint16).disassemble(bytes(1,1)).should == 257
    base_data_instance(:uint32).disassemble(bytes(1,1,1,1)).should == 16843009
    
    #FIXME
    #base_data_instance(:uint64).disassemble(bytes(1,1,1,1,1,1,1,1)).should_not == 16843009
  end
  
  it "should assemble ints" do
    base_data_instance(:int8,1).as_raw.should == bytes(1)
    base_data_instance(:int8,255).as_raw.should == bytes(255)
    base_data_instance(:int8,255).as_raw.size.should == 1
    
    base_data_instance(:int16,1).as_raw.should == bytes(1,0)
    
    base_data_instance(:int32,1).as_raw.should == bytes(1,0,0,0)
  end
  
  it "should limit values on ints" do
    base_data_instance(:int8,-10).value.should == 0
    base_data_instance(:int8,256).value.should == 255
    
    base_data_instance(:int16,-10).value.should == 0
    base_data_instance(:int16,75000).value.should == 65535
    
    base_data_instance(:uint16,-46000).value.should == -32768
    base_data_instance(:uint16, 46000).value.should ==  32767
    
    base_data_instance(:int32,-5).value.should == 0
    base_data_instance(:int32,5000000000).value.should == 4294967296
    
    base_data_instance(:uint32,-5000000000).value.should == -2147483648
    base_data_instance(:uint32, 5000000000).value.should == 2147483647
    
    #lol Disgaea, without you I'd never imagine I'd be seriously using numbers like these to test things
    base_data_instance(:uint64,-20000000000000000000).value.should == -18446744073709551616
    base_data_instance(:uint64, 20000000000000000000).value.should ==  18446744073709551615
  end
  
  it "should limit length and values in strings"
  
  it "should limit length and values in disgaea strings"
  
  it "should properly convert in disgaea strings" do
    BaseData::DisgaeaString.translate(BaseData::DisgaeaString.untranslate("Kyoko")).should == "Kyoko"
    BaseData::DisgaeaString.translate(BaseData::DisgaeaString.untranslate("Characters -")).should == "Characters -"
  end
  
end
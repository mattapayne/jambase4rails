require File.dirname(__FILE__) + '/../../spec_helper'

describe JamBase4Rails::Converter do
  include JamBase4Rails::Converter
  
  it "should return nil if the xml passed to convert is nil" do
    convert(nil).should be_nil
  end
  
  it "should return nil if the xml passed to convert is empty" do
    convert("").should be_nil
  end
  
  it "should convert xml passed to convert into a hash" do
    convert(xml_response).should be_is_a(Hash)
  end
  
end
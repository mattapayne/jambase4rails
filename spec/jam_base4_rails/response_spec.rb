require File.dirname(__FILE__) + '/../spec_helper'

describe JamBase4Rails::Response do
  
  before(:each) do
    @r = JamBase4Rails::Response.new("200", "OK", xml_response)
  end
  
  it "should not be fake by default" do
    @r.should_not be_fake
  end
  
  it "should return a fake response when asked to do so" do
    resp = JamBase4Rails::Response.fake_response
    resp.should be_fake
  end
  
end
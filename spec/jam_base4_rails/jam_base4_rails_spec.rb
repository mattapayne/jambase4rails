require File.dirname(__FILE__) + '/../spec_helper'

describe JamBase4Rails do
  
  it "should respond_to? :configure" do
    JamBase4Rails.should respond_to(:configure)
  end
  
  it "should raise an exception if the api key is not set" do
    lambda{
      JamBase4Rails.configure do |s|
        
      end
    }.should raise_error
  end
  
  it "should reset the settings object if configuration failed" do
     begin
      JamBase4Rails.configure do |s|
        
      end
     rescue
     end
     JamBase4Rails.jambase_settings.api_key.should be_nil
     JamBase4Rails.jambase_settings.fake_calls.should be_false
  end 
  
end
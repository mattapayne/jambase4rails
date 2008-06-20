require File.dirname(__FILE__) + '/../spec_helper'

describe JamBase4Rails::SettingsMethods do
  include JamBase4Rails::SettingsMethods
  
  before(:each) do
    @settings = JamBase4Rails::Settings.new
    @settings.api_key = "sdsdfsdfsd"
  end
  
  it "should ask the JamBase4Rails module's settings object for its api key" do
    JamBase4Rails.should_receive(:jambase_settings).and_return(@settings)
    self.jambase_api_key
  end
  
  it "should ask the JamBase4Rails module's settings object for fake_calls" do
    JamBase4Rails.should_receive(:jambase_settings).and_return(@settings)
    self.fake_jambase_calls
  end
  
end
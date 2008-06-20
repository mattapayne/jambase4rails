require File.dirname(__FILE__) + '/../../spec_helper'

describe JamBase4Rails::Events do
  
  def multiple_events_hash(title="something")
    {"JamBase_Data" => 
        {"Results_Title" => title,
        "event" => [{"event_id" => "1", "event_url" => "www.test1.ca"}, 
          {"event_id" => "1", "event_url" => "www.test2.ca"}]
      }}
  end
  
  def single_event_hash(title="something")
    {"JamBase_Data" => 
        {"Results_Title" => title,
        "event" => {"event_id" => "1", "event_url" => "www.test1.ca"}
      }}
  end
  
  it "should have 0 items if the hash passed to its constructor is nil" do
    JamBase4Rails::Events.new(nil, nil).should have(0).items
  end
  
  it "should have 0 items if the hash passed to its constructor is empty" do
    JamBase4Rails::Events.new({}, nil).should have(0).items
  end
  
  it "should have 0 items if the hash passed does not have a key of JamBase_Data" do
    JamBase4Rails::Events.new({"Blah" => {}}, nil).should have(0).items
  end
  
  it "should have multiple items if the hash passed in is good" do
    JamBase4Rails::Events.new(multiple_events_hash, "").should_not have(0).items
  end
  
  it "should properly handle a hash of multiple events" do
    JamBase4Rails::Event.should_receive(:new).exactly(2).times
    JamBase4Rails::Events.new(multiple_events_hash, "")
  end
  
  it "should properly handle a hash of a single event" do
    JamBase4Rails::Event.should_receive(:new).exactly(1).times
    JamBase4Rails::Events.new(single_event_hash, "")
  end
  
  it "should set the title if the title is present" do
    events = JamBase4Rails::Events.new(multiple_events_hash, "")
    events.title.should == "something"
  end
  
  it "should leave the title nil if the title is not present" do
    events = JamBase4Rails::Events.new(multiple_events_hash(nil), "")
    events.title.should be_nil
  end
  
end
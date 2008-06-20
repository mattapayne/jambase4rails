require File.dirname(__FILE__) + '/../../spec_helper'

describe JamBase4Rails::Model do
  
  before(:each) do
    @model1 = JamBase4Rails::Model.new("Model", {"stuff" => "The value of stuff",
        "venue" => {"venue_id" => "1", "venue_name" => "A venue"},
        "not_a_class" => {"x" => 1, "y" => 2}
      })
    @model2 = JamBase4Rails::Model.new("Model", 
      {:stuff => "The value of stuff", "other_stuff" => "The value of other stuff"})
  end
  
  it "should raise an exception if the model_name is nil" do
    lambda{
      JamBase4Rails::Model.new(nil, {:test => "Test"})
    }.should raise_error
  end
  
  it "should raise an exception if the model_name is empty" do
    lambda{
      JamBase4Rails::Model.new("", {:test => "Test"})
    }.should raise_error
  end
  
  it "should raise an exception if the attributes is nil" do
    lambda{
      JamBase4Rails::Model.new("Something", nil)
    }.should raise_error
  end
  
  it "should raise an exception if the attributes is empty" do
    lambda{
      JamBase4Rails::Model.new("Something", {})
    }.should raise_error
  end
  
  it "should return the value of a key in its attributes" do
    @model1.stuff.should == "The value of stuff"
  end
  
  it "should not care whether attribute keys are strings or symbols" do
    @model2.stuff.should == "The value of stuff"
    @model2.other_stuff.should == "The value of other stuff"
  end
  
  it "should raise an exception if the method called is not a key in its attributes" do
    lambda {
      @model1.monkey
    }.should raise_error
  end
  
  it %{should attempt to instantiate another model if the value of one of its 
      attribute keys is a hash} do
    @model1.venue.should be_is_a(JamBase4Rails::Venue)
  end
  
  it %{should return the value of one of its attribute keys if it is a hash but
      the key does not correspond to a class} do
    @model1.not_a_class.should be_is_a(Hash)
  end
  
end
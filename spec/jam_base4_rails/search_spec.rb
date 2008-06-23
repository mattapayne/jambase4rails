require File.dirname(__FILE__) + '/../spec_helper'

describe JamBase4Rails::Search do
  include JamBase4Rails::Search
  
  def default_search_args
    {:artist => "Some Band", :zip => "90210", :radius => 50}
  end
  
  before(:each) do
    @resp = mock("Response")
    @resp.stub!(:code).and_return("200")
    @resp.stub!(:message).and_return("OK")
    @resp.stub!(:body).and_return(xml_response)
    @gateway = self.send(:jambase_gateway)
    @gateway.stub!(:get).and_return(@resp)
    self.stub!(:jambase_api_key).and_return("xxxxxxxx")
  end
  
  it "should return nil from jambase_search if search args are nil" do
    self.send(:jambase_search, nil).should be_nil
  end
  
  it "should return nil from jambase_search if search args are empty" do
    self.send(:jambase_search, {}).should be_nil
  end
  
  it "should return nil if after cleaning the search args they are empty" do
    search_args = default_search_args.merge(
      :zip => nil, :radius => "", :artist => "")
    self.send(:jambase_search, search_args).should be_nil
  end
  
  it "should raise an exception if both the aliased param and the real param are set" do
    search_args = default_search_args.merge(:band => "The Monkeys")
    lambda {
      self.send(:jambase_search, search_args)
    }.should raise_error
  end
  
  it "should call get on the gateway object with a properly constructed url" do
    url = "http://api.jambase.com/search?band=Some+Band&apikey=xxxxxxxx"
    @gateway.should_receive(:get).with(url).and_return(@resp)
    self.send(:jambase_search, default_search_args.merge(
        :zip => nil, :radius => nil))
  end
  
  it "should return an instance of JamBase4Rails::Response" do
    result = self.send(:jambase_search, default_search_args.merge(
        :zip => nil, :radius => nil))
    result.should be_is_a(JamBase4Rails::Response)
  end
  
end

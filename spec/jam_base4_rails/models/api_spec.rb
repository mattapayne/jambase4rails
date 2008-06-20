require File.dirname(__FILE__) + '/../../spec_helper'

describe JamBase4Rails::API do
  
  class JamBase4Rails::API
    
    def self.singleton_class
      class << self; self; end
    end
    
  end
  
  it "should extend the module Search" do
    JamBase4Rails::API.singleton_class.included_modules.should include(JamBase4Rails::Search)
  end
  
  it "should extend the module Converter" do
    JamBase4Rails::API.singleton_class.included_modules.should include(JamBase4Rails::Search)
  end
  
  it "should respond_to? search" do
    JamBase4Rails::API.should respond_to(:search)
  end
  
  it "should respond_to? search_by_artist" do
    JamBase4Rails::API.should respond_to(:search_by_artist)
  end
  
  it "should respond_to? search by zip_code" do
    JamBase4Rails::API.should respond_to(:search_by_zipcode)
  end
  
  describe "search" do
    
    before(:each) do
      @r = JamBase4Rails::Response.new("200", "OK", xml_response)
      JamBase4Rails::API.stub!(:jambase_search).and_return(@r)
    end
    
    it "should call jambase_search" do
      JamBase4Rails::API.should_receive(:jambase_search).with(:band => "monkey").and_return(@r)
      JamBase4Rails::API.search(:band => "monkey")
    end
    
    it "should return a new Events object" do
      JamBase4Rails::Events.should_receive(:new)
      JamBase4Rails::API.search(:band => "monkey")
    end
    
    it "should convert the response to a hash" do
      JamBase4Rails::API.should_receive(:convert).with(xml_response)
      JamBase4Rails::API.search(:band => "monkey")
    end
    
  end
  
  describe "custom methods" do
    
    before(:each) do
      @r = JamBase4Rails::Response.new("200", "OK", "Body")
      JamBase4Rails::API.stub!(:search).and_return(@r)
    end
   
    describe "search_by_zipcode" do
      
      it "should replace the value if :zip in additional filters" do
        options = {:zip => "90210"}
        JamBase4Rails::API.search_by_zipcode("99999", options)
        options[:zip].should == "99999"
      end
      
      it "should call search" do
        JamBase4Rails::API.should_receive(:search).with({:zip => "99999"}).and_return(@r)
        JamBase4Rails::API.search_by_zipcode("99999")
      end
      
    end
  
    describe "search_by_artist" do
      
      it "should replace the value of :artists in additional filters" do
        options = {:artist => "TEST"}
        JamBase4Rails::API.search_by_artist("A Band", options)
        options[:artist].should == "A Band"
      end
    
      it "should call search" do
        JamBase4Rails::API.should_receive(:search).with({:artist => "A Band"}).and_return(@r)
        JamBase4Rails::API.search_by_artist("A Band")
      end
    
    end
    
  end
  
end
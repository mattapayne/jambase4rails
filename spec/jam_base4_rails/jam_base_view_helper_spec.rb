require File.dirname(__FILE__) + '/../spec_helper'

describe JamBase4Rails::ViewHelper do
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper
  include JamBase4Rails::ViewHelper
 
  it "should render a default text attribution" do
    self.jambase_text_attribution().should == 
      "<span>*Concert information provided by <a href=\"http://www.jambase.com\" target=\"_blank\">JamBase</a></span>"
  end
  
  it "should render a text attribution with custom text" do
    self.jambase_text_attribution("blah ").should == 
      "<span>blah <a href=\"http://www.jambase.com\" target=\"_blank\">JamBase</a></span>"
  end
  
  it "should render a text attribution with custom span settings" do
    self.jambase_text_attribution(nil, {}, {:class=> "test"}).should == 
      "<span class=\"test\">*Concert information provided by <a href=\"http://www.jambase.com\" target=\"_blank\">JamBase</a></span>"
  end
  
  it "should render a text attribution with custom link settings" do
    self.jambase_text_attribution(nil, {:class => "test"}, {}).should == 
      "<span>*Concert information provided by <a href=\"http://www.jambase.com\" class=\"test\" target=\"_blank\">JamBase</a></span>"
  end
  
  it "should render a default image attribution" do
    re = /^<a href="http:\/\/www.jambase.com" target="_blank" title="JamBase Concert Search"><img alt="Search JamBase Concerts" border="0" src=".*" \/><\/a>$/
    self.jambase_image_attribution().should =~ re
  end
  
  it "should render an image attribution with custom image settings" do
    re = /^<a href="http:\/\/www.jambase.com" target="_blank" title="JamBase Concert Search"><img alt="Search JamBase Concerts" border="50" src=".*" \/><\/a>$/
    self.jambase_image_attribution({:border => 50}).should =~ re
  end
  
  it "should render an image attribution with custom link settings" do
    re = /^<a href="http:\/\/www.jambase.com" class="test" target="_blank" title="JamBase Concert Search"><img alt="Search JamBase Concerts" border="0" src=".*" \/><\/a>$/
    self.jambase_image_attribution({}, {:class => "test"}).should =~ re
  end
  
  it "should render a default favicon" do
    re = /^<a href="http:\/\/www.jambase.com" target="_blank"><img alt="JamBase" border="0" src=".*" \/><\/a>$/
    self.jambase_favicon().should =~ re
  end
  
  it "should render a favicon with custom image settings" do
    re = /^<a href="http:\/\/www.jambase.com" target="_blank"><img alt="JamBase" border="50" src=".*" \/><\/a>$/
    self.jambase_favicon({:border => 50}, {}).should =~ re
  end
  
  it "should render a favicon with custom link settings" do
    re = /^<a href="http:\/\/www.jambase.com" class="test" target="_blank"><img alt="JamBase" border="0" src=".*" \/><\/a>$/
    self.jambase_favicon({}, {:class => "test"}).should =~ re
  end
end

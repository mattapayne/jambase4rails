module JamBase4Rails
  
  module ViewHelper
    
    def jambase_text_attribution(text=nil, link_options={}, span_options={})
      text = "*Concert information provided by " if text.blank?
      content_tag(:span, "#{text}#{link_to('JamBase', 'http://www.jambase.com', 
        link_options)}", span_options)
    end
    
    def jambase_image_attribution(image_options={}, link_options={})
      link_options = {:title => "JamBase Concert Search", 
        :target => "_top"}.merge(link_options)
      image_options = {:alt => "Search JamBase Concerts",
        :border => "0"}.merge(image_options)
      link_to(image_tag("jambase140x70.gif", image_options), 
        'http://www.jambase.com', link_options)
    end
    
    def jambase_favicon(image_options={}, link_options={})
      image_options = {:alt => "JamBase", :border => "0"}.merge(image_options)
      link_to(image_tag("jambase_favicon.ico", image_options), 
        "http://www.jambase.com", link_options)
    end
    
  end
  
end

module JamBase4Rails
  
  class API
    extend Search, Converter
   
    #Search Options:
    #:artist = The name of an artist
    #:band = alias for artist
    #:zip = The zipcode to search
    #:radius = The distance around the zipcode to search
    #These can be combined, although I doubt that :artist combined with :radius
    #would do anything useful ;)
    def self.search(search_options={})
      result = jambase_search(search_options)
      return Events.new(convert(result.body), result.body) unless result.blank?
    end
    
    #Additional Filters - As above, but without :artist/band
    def self.search_by_artist(artist_name, additional_filters={})
      additional_filters[:artist] = artist_name
      return search(additional_filters)
    end
    
    #Additional Filters - As above, but without :zip
    def self.search_by_zipcode(zipcode, additional_filters={})
      additional_filters[:zip] = zipcode
      return search(additional_filters)
    end
    
  end
  
end

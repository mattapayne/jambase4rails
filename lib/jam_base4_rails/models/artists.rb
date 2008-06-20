module JamBase4Rails
  
  class Artists < Array
    
    ARTIST_ATTR = "artist"
    
    def initialize(attributes)
      return if attributes.blank? || !attributes.key?(ARTIST_ATTR)
      #attributes in this case is a hash like: 
      #{"artist" => [{artist one}, {artist 2}, {artist 3}]
      #but it could also be {"artist" => {single artist}} if there is only one
      create_artists(attributes[ARTIST_ATTR])
    end
    
    private
    
    def create_artists(artists)
      if artists.is_a?(Array)
        artists.each {|e| self << Model.new("Artist", e)}
      else
        self << Model.new("Artist", artists)
      end
    end
    
  end
  
end

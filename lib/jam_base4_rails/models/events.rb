module JamBase4Rails
  
  class Events < Array
    
    DATA_ATTR = "JamBase_Data"
    TITLE_ATTR = "Results_Title"
    EVENT_ATTR = "event"
    
    attr_reader :title, :xml
    
    def initialize(hash, xml)
      return if hash.blank? || !hash.key?(DATA_ATTR)
      @xml = xml
      #The title is stored like: {"JamBase_Data" => {"Results_Title => "Something}
      set_title(hash[DATA_ATTR][TITLE_ATTR])
      #The events are stored like: {"JamBase_Data" => {"event" => [{event 1}, {event 2}]}
      #except if there is only one event. Then its like: 
      #{"JamBase_Data" => {"event" => {only event}}
      create_events(hash[DATA_ATTR][EVENT_ATTR])
    end
    
    private
    
    def set_title(value)
      @title = value
    end
    
    def create_events(events)
      return if events.blank?
      if events.is_a?(Array)
        events.each {|e| self << Event.new(e)}
      else
        self << Event.new(events)
      end
    end
    
  end
  
end

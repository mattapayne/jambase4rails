module JamBase4Rails
  
  class Settings
    attr_accessor :api_key, :fake_calls
    
    def initialize
      @fake_calls = false
    end
    
  end
  
end

module JamBase4Rails
  
  module SettingsMethods
      
    def jambase_api_key
      JamBase4Rails.jambase_settings.api_key
    end
    
    def fake_jambase_calls
      JamBase4Rails.jambase_settings.fake_calls
    end
      
  end
  
end

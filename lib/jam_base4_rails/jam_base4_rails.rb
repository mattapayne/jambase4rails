module JamBase4Rails
  
  def self.configure(&block)
    raise ArgumentError.new("A block is expected.") unless block_given?
    success = false
    begin
      block.call(jambase_settings)
      raise ArgumentError.new("You must supply an api key.") if jambase_settings.api_key.blank?
      success = true
    ensure
      unless success
        @@settings = nil
      end
    end
  end
  
  def self.jambase_settings
    @@settings ||= JamBase4Rails::Settings.new
  end
  
end
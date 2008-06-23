module JamBase4Rails
  
  module Search
    include SettingsMethods
    
    def self.included(klazz)
      klazz.send(:include, SearchMethods)
    end
    
    def self.extended(klazz)
      klazz.extend(SearchMethods)
    end
    
    module SearchMethods
      
      API_URL = "http://api.jambase.com/search"
    
      private
      
      def jambase_search(search_args)
	    check_api_key
        return if search_args.blank?
        search_args = search_args.symbolize_keys
        replace_aliased_keys!(search_args)
        remove_unnecessary_params!(search_args)
        return if search_args.blank?
        return JamBase4Rails::Response.fake_response if fake_jambase_calls
        result = jambase_gateway.get(create_query_string(search_args))
        return JamBase4Rails::Response.new(result.code, result.message, result.body)
      end

      def check_api_key
        if jambase_api_key.blank?
	  raise ArgumentError.new("No JamBase API key configured. Please add a configuration to #{RAILS_ENV}.rb")
        end
      end
      
      def replace_aliased_keys!(options)
        jambase_params_map.each do |alias_param, real_param|
          if options.key?(alias_param)
            check_for_alias_and_real_param!(options, alias_param, real_param)
            value = options[alias_param]
            options[real_param] = value
          end
        end
      end
      
      def check_for_alias_and_real_param!(options, alias_param, real_param)
        unless options[real_param].blank?
          raise ArgumentError.new("Cannot have both #{alias_param} and #{real_param}.")
        end
      end
      
      def remove_unnecessary_params!(options)
        options.reject! do |key, value|
          !jambase_parameters.include?(key) ||
            value.blank?
        end
      end
    
      def jambase_parameters
        [:zip, :radius, :band]
      end
    
      def create_query_string(search_args)
        "#{API_URL}?#{search_args.to_param}&apikey=#{jambase_api_key}"
      end
    
      def jambase_gateway
        @@gateway ||= JamBase4Rails::HttpGateway.new
      end
      
      def jambase_params_map
        {:artist => :band}
      end
      
    end
    
  end
  
end

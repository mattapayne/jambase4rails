require 'net/http'

module JamBase4Rails
  
  class HttpGateway
    include Errors
    
    def self.logger=(logger)
      @@logger = logger
    end
    
    def get(url)
      log_info("#{self.class.name} - Performing GET with URL: #{url}.")
      url = URI.parse(url)
      request = Net::HTTP::Get.new(url.path_with_querystring)
      response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
      handle_response(response)
    rescue Timeout::Error => e
      raise TimeoutError.new(e.message)
    end
    
    private
    
    def handle_response(response)
      case response.code.to_i
      when 301,302
        raise(Redirection.new(response))
      when 200...400
        response
      when 400
        raise(BadRequest.new(response))
      when 401
        raise(UnauthorizedAccess.new(response))
      when 403
        raise(ForbiddenAccess.new(response))
      when 404
        raise(ResourceNotFound.new(response))
      when 405
        raise(MethodNotAllowed.new(response))
      when 409
        raise(ResourceConflict.new(response))
      when 422
        raise(ResourceInvalid.new(response))
      when 401...500
        raise(ClientError.new(response))
      when 500...600
        raise(ServerError.new(response))
      else
        raise(ConnectionError.new(response, "Unknown response code: #{response.code}"))
      end
    end
      
    def log_info(msg)
      @@logger.info(msg) if @@logger
    end
    
  end
  
end

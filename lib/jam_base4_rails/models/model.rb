module JamBase4Rails
  
  class Model
    
    attr_reader :model_type
    
    def initialize(model_type, attributes)
      raise ArgumentError.new("model_type is required.") if model_type.blank?
      raise ArgumentError.new("attributes is required.") if attributes.blank?
      @model_type, @attributes = model_type, attributes
      @attributes.stringify_keys!
    end
    
    def to_s
      @model_type
    end
    
    private
    
    def method_missing(method_name, *args)
      method_name = method_name.to_s
      if @attributes && @attributes.key?(method_name)
        value = @attributes[method_name]
        if value.is_a?(Hash)
          return handle_nested_type(method_name, value)
        else
          return value
        end
      end
      super
    end
    
    #Attempt to get a constant based on the name.
    #If a constant can be found, call new on it and return it.
    #Otherwise, just return the value
    def handle_nested_type(name, value)
      return_value = value
      begin
        klazz = "JamBase4Rails::#{name.humanize}".constantize
        return_value = klazz.new(value)
      rescue NameError
      end
      return return_value
    end
    
  end
  
end

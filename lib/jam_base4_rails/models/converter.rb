module JamBase4Rails
  
  module Converter
    
    def self.included(klazz)
      klazz.send(:include, ConvertMethods)
    end
    
    def self.extended(klazz)
      klazz.extend(ConvertMethods)
    end
    
    module ConvertMethods
      
      def convert(xml)
        unless xml.blank?
          Hash.from_xml(xml)
        end
      end
      
    end
    
  end
  
end

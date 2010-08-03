module Fog
  module Parsers
    module Xenserver
      class Base
        
        attr_reader :response
        
        def initialize
          reset
        end
        
        def reset
          @response = {}
        end
        
        def parse( data )
          if data.is_a? Hash
            @response = data.symbolize_keys!
          elsif data.is_a? Array
            @respnose = data.flatten
          end
          
          @response
        end
        
      end
    end
  end
end
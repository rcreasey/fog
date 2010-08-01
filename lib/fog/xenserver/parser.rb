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
        
        def parse
          @response
        end
        
      end
    end
  end
end
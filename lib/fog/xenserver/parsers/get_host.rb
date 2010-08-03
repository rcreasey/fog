module Fog
  module Parsers
    module Xenserver
      class GetHost < Fog::Parsers::Xenserver::Base
        
        def parse( data )
          if data.is_a? Hash
            data
          elsif data.is_a? Array
            data.flatten
          end
        end
        
      end
      
    end
  end
end

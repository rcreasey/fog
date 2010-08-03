module Fog
  module Parsers
    module Xenserver
      class GetSr < Fog::Parsers::Xenserver::Base
        
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

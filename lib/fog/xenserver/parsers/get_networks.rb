module Fog
  module Parsers
    module Xenserver
      class GetNetworks < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, network_hash| @response << parser.parse( network_hash ) }
        end
        
      end
      
    end
  end
end

module Fog
  module Parsers
    module Xenserver
      class GetHosts < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, host_hash| @response << parser.parse( host_hash ).merge(:reference => reference) }
        end
        
      end
      
    end
  end
end

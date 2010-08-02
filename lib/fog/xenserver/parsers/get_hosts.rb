module Fog
  module Parsers
    module Xenserver
      class GetHosts < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          host_parser = Fog::Parsers::Xenserver::GetHost.new
          data.each_pair {|reference, host| @response << host_parser.parse( host )}
        end
        
      end
      
    end
  end
end

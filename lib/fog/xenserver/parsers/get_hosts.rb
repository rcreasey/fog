module Fog
  module Parsers
    module Xenserver
      class GetHosts < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, host| @response << parser.parse( host )}
        end
        
      end
      
    end
  end
end

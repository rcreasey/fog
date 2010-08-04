module Fog
  module Parsers
    module Xenserver
      class GetVifs < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, vif_hash| @response << parser.parse( vif_hash ).merge(:reference => reference) }
        end
        
      end
      
    end
  end
end

module Fog
  module Parsers
    module Xenserver
      class GetSrs < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, sr_hash| @response << parser.parse( sr_hash ).merge(:reference => reference) }
        end
        
      end
      
    end
  end
end

module Fog
  module Parsers
    module Xenserver
      class GetVms < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, vm_hash| @response << parser.parse( vm_hash ).merge(:reference => reference) }
        end
        
      end
      
    end
  end
end

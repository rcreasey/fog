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
          @response.sort! {|a,b| a[:name_label] <=> b[:name_label]}
        end
        
      end
      
    end
  end
end

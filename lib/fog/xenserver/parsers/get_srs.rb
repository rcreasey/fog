module Fog
  module Parsers
    module Xenserver
      class GetSrs < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair {|reference, sr| @response << parser.parse( sr )}
          @response.sort! {|a,b| a[:name_label] <=> b[:name_label]}
        end
        
      end
      
    end
  end
end

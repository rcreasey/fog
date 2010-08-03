module Fog
  module Parsers
    module Xenserver
      class GetSrs < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair do |reference, sr_hash|
            sr = parser.parse( sr_hash )
            @response << sr if sr[:shared] and !sr[:content_type].eql?('iso')
          end
          @response.sort! {|a,b| a[:name_label] <=> b[:name_label]}
        end
        
      end
      
    end
  end
end

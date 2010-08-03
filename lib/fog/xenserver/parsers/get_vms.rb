module Fog
  module Parsers
    module Xenserver
      class GetVms < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          parser = Fog::Parsers::Xenserver::Base.new
          data.each_pair do |reference, vm_hash|
            vm = parser.parse( vm_hash )
            @response << vm unless (vm[:is_a_template] or vm[:is_control_domain] or vm[:is_snapshot])
          end
          @response.sort! {|a,b| a[:name_label] <=> b[:name_label]}
          
        end
        
      end
      
    end
  end
end

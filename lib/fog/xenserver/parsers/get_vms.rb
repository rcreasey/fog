module Fog
  module Parsers
    module Xenserver
      class GetVms < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          vm_parser = Fog::Parsers::Xenserver::GetVm.new
          data.each_pair do |reference, vm|
            @vm = vm_parser.parse( vm )
            @response << @vm unless (@vm[:is_a_template] or @vm[:is_control_domain] or @vm[:is_snapshot])
          end
          @response.sort! {|a,b| a[:name] <=> b[:name]}
          
        end
        
      end
      
    end
  end
end

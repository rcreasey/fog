module Fog
  module Parsers
    module Xenserver
      class GetVms < Fog::Parsers::Xenserver::Base
        
        def reset
          @response = []
        end
        
        def parse( data )
          data.each_pair do |reference, vm|
            @vm = {:is_a_template => false, :is_control_domain => false, :is_snapshot => false}
            
            @vm[:uuid] = vm['uuid'] if vm.has_key?('uuid')
            @vm[:name] = vm['name_label'] if vm.has_key?('name_label')
            @vm[:description] = vm['name_description'] if vm.has_key?('name_description')
            @vm[:arch] = vm['domarch'] if vm.has_key?('domarch')
            @vm[:cpu] = vm['VCPUs_max'].to_i if vm.has_key?('VCPUs_max')
            @vm[:memory] = (vm['memory_static_max'].to_i  / 1073741824) if vm.has_key?('memory_static_max')
            
            @vm[:is_a_template] = vm['is_a_template'] if vm.has_key?('is_a_template')
            @vm[:is_snapshot] = vm['is_snapshot'] if vm.has_key?('is_snapshot')
            @vm[:is_control_domain] = vm['is_control_domain'] if vm.has_key?('is_control_domain')
            
            @vm[:affinity] = vm['affinity'].split(':').last if vm.has_key?('affinity')
            @vm[:metrics] = vm['metrics'].split(':').last if vm.has_key?('metrics')
            
            @vm[:consoles] = vm['consoles'].map {|c| c.split(':').last } if vm.has_key?('consoles')
            @vm[:vifs] = vm['VIFs'].map {|v| v.split(':').last } if vm.has_key?('VIFs')
            @vm[:vbds] = vm['VBDs'].map {|v| v.split(':').last } if vm.has_key?('VBDs')
            
            @response << @vm unless (@vm[:is_a_template] or @vm[:is_control_domain] or @vm[:is_snapshot])
          end
          @response.sort! {|a,b| a[:name] <=> b[:name]}
          
        end
        
      end
      
    end
  end
end

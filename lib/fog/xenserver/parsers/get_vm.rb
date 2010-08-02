module Fog
  module Parsers
    module Xenserver
      class GetVm < Fog::Parsers::Xenserver::Base
        
        def parse( data )
          # Depending on how the VM was called, if it's a Hash, it's the actual record,
          # if it's an Array, it's the OpaqueRef
          if data.is_a? Hash
            @response[:uuid] = data['uuid'] if data.has_key?('uuid')
            @response[:name] = data['name_label'] if data.has_key?('name_label')
            @response[:description] = data['name_description'] if data.has_key?('name_description')
            @response[:arch] = data['domarch'] if data.has_key?('domarch')
            @response[:cpu] = data['VCPUs_max'].to_i if data.has_key?('VCPUs_max')
            @response[:memory] = (data['memory_static_max'].to_i  / 1073741824) if data.has_key?('memory_static_max')
            
            @response[:is_a_template] = data['is_a_template'] if data.has_key?('is_a_template')
            @response[:is_snapshot] = data['is_snapshot'] if data.has_key?('is_snapshot')
            @response[:is_control_domain] = data['is_control_domain'] if data.has_key?('is_control_domain')
            
            @response[:affinity] = data['affinity'].split(':').last if data.has_key?('affinity')
            @response[:metrics] = data['metrics'].split(':').last if data.has_key?('metrics')
            
            @response[:consoles] = data['consoles'].map {|c| c.split(':').last } if data.has_key?('consoles')
            @response[:vifs] = data['VIFs'].map {|v| v.split(':').last } if data.has_key?('VIFs')
            @response[:vbds] = data['VBDs'].map {|v| v.split(':').last } if data.has_key?('VBDs')
            
          elsif data.is_a? Array
            @response = data.flatten
          end
          
          @response
        end
        
      end
      
    end
  end
end

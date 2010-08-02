module Fog
  module Parsers
    module Xenserver
      class GetVm < Fog::Parsers::Xenserver::Base
        
        def parse( data )
          
          if data.is_a? Hash
            @response[:uuid]        = data['uuid'] if data.has_key?('uuid')
            @response[:name]        = data['name_label'] if data.has_key?('name_label')
            @response[:description] = data['name_description'] if data.has_key?('name_description')
            @response[:arch]        = data['domarch'] if data.has_key?('domarch')
            @response[:cpu]         = data['VCPUs_max'].to_i if data.has_key?('VCPUs_max')
            @response[:memory]      = (data['memory_static_max'].to_i / 1073741824) if data.has_key?('memory_static_max')
            @response[:status]      = data['power_state'] if data.has_key?('power_state')
            
            @response[:is_a_template]     = data['is_a_template'] if data.has_key?('is_a_template')
            @response[:is_snapshot]       = data['is_snapshot'] if data.has_key?('is_snapshot')
            @response[:is_control_domain] = data['is_control_domain'] if data.has_key?('is_control_domain')
            
            @response[:affinity] = data['affinity'] if data.has_key?('affinity')
            @response[:metrics]  = data['metrics'] if data.has_key?('metrics')
            
            @response[:consoles] = data['consoles'] if data.has_key?('consoles')
            @response[:vifs]     = data['VIFs'] if data.has_key?('VIFs')
            @response[:vbds]     = data['VBDs'] if data.has_key?('VBDs')
            
          elsif data.is_a? Array
            @response = data.flatten
          end
          
          @response
        end
        
      end
      
    end
  end
end

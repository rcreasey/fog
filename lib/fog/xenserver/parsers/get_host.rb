module Fog
  module Parsers
    module Xenserver
      class GetHost < Fog::Parsers::Xenserver::Base
        
        def parse( data )
          
          if data.is_a? Hash
            @response[:uuid] = data['uuid'] if data.has_key?('uuid')
            @response[:name] = data['name_label'] if data.has_key?('name_label')
            @response[:description] = data['name_description'] if data.has_key?('name_description')
            @response[:address] = data['address'] if data.has_key?('address')
            @response[:enabled] = data['enabled'] if data.has_key?('enabled')
            
            @response[:resident_vms] = data['resident_VMs'] if data.has_key?('resident_VMs')
            @response[:metrics] = data['metrics'] if data.has_key?('metrics')
            
            @response[:pifs] = data['PIFs'] if data.has_key?('PIFs')
            @response[:pbds] = data['PBDs'] if data.has_key?('PBDs')
            
            @response[:iscsi_iqn] = data['other_config']['iscsi_iqn'] if data.has_key?('other_config') and data['other_config'].has_key?('iscsi_iqn')
            @response[:multipathing] = data['other_config']['multipathing'] if data.has_key?('other_config') and data['other_config'].has_key?('iscsi_iqn')
            
          elsif data.is_a? Array
            @response = data.flatten
          end
          
          @response
        end
        
      end
      
    end
  end
end

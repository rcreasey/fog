module Fog
  module Parsers
    module Xenserver
      
      class GetVm < Fog::Parsers::Xenserver::Base
        
        def reset
          @vm = {}
          @response = { 'vms' => [] }
        end
        
        def characters(string)
          @value ||= ''
          @value << string.strip
        end
        
        def body
          @stack.last[:Value]
        end
        
        def end_element(name)
          # case name
          # when 'name_label' 
          #   @vm['name'] = @value
          # when 'name_description' 
          #   @vm['description'] = @value
          # when 'domarch' 
          #   @vm['arch'] = @value
          # when 'VCPUs_max' 
          #   @vm['cpu'] = @value.to_i
          # when 'memory_static_max' 
          #   @vm['memory'] = @value.to_i / 1073741824
          # when 'consoles'
          #   @vm['consoles'] ||= []
          #   @vm['consoles'] << @value.split(':').last
          # when 'VIFs'
          #   @vm['vifs'] ||= []
          #   @vm['vifs'] << @value.split(':').last
          # when 'VBDs'
          #   @vm['vbds'] ||= []
          #   @vm['vbds'] << @value.split(':').last
          # when 'is_a_template'
          #   @vm['is_a_template'] = @value
          # when 'is_snapshot'
          #   @vm['is_snapshot'] = @value
          # when 'is_control_domain'
          #   @vm['is_control_domain'] = @value
          # when 'affinity'
          #   @vm['affinity_uuid'] = @value.split(':').last
          # when 'metrics'
          #   @vm['metrics_uuid'] = @value.split(':').last
          # when /OpaqueRef:(.*)/
          #   @vm['uuid'] = $1
          #   @response['vms'] << @vm if (@vm['is_a_template'] or @vm['is_control_domain'] or @vm['is_snapshot'])
          #   @vm = {}
          # end
        end

      end

    end
  end
end

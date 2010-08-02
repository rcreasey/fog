require 'fog/model'

module Fog
  module Xenserver

    class Vm < Fog::Model
      # API Reference here:
      # http://docs.vmd.citrix.com/XenServer/5.6.0/1.0/en_gb/api/?c=VM
      
      identity :name
      
      attribute :uuid
      attribute :description
      attribute :arch
      attribute :cpu
      attribute :memory
      attribute :status
      
      attribute :consoles
      attribute :vifs
      attribute :vbds
      
      attribute :is_a_template
      attribute :is_snapshot
      attribute :is_control_domain
      
      attribute :affinity
      attribute :metrics
      
      def initialize(attributes={})
        @uuid ||= 0
        super
      end
      
    end
    
  end
end

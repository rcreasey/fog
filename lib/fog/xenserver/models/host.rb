require 'fog/model'
require 'fog/xenserver/parsers/get_vm'

module Fog
  module Xenserver
    class Host < Fog::Model
      # API Reference here:
      # http://docs.vmd.citrix.com/XenServer/5.6.0/1.0/en_gb/api/?c=host
      
      identity :name
      
      attribute :uuid
      attribute :description
      attribute :address
      attribute :enabled
      
      attribute :resident_vms
      attribute :metrics
      
      attribute :pifs
      attribute :pbds
      
      attribute :iscsi_iqn
      attribute :multipathing
      
      def initialize(attributes={})
        @uuid ||= 0
        super
      end
      
    end
    
  end
end

require 'fog/model'

module Fog
  module Xenserver
    class Host < Fog::Model
      # API Reference here:
      # http://docs.vmd.citrix.com/XenServer/5.6.0/1.0/en_gb/api/?c=host
      
      identity :uuid
      
      attribute :name_label
      attribute :address
      attribute :allowed_operations
      attribute :enabled
      attribute :hostname
      attribute :metrics
      attribute :name_description
      attribute :other_config
      attribute :PBDs
      attribute :PIFs
      attribute :resident_VMs
      
      ignore_attributes :API_version_major, :API_version_minor, :API_version_vendor, :API_version_vendor_implementation,
                        :blobs, :capabilities, :cpu_configuration, :crash_dump_sr, :crashdumps, :current_operations,
                        :external_auth_configuration, :external_auth_service_name, :external_auth_type,
                        :ha_network_peers, :ha_statefiles, :host_CPUs, :license_params, :logging, :patches,
                        :sched_policy, :software_version, :supported_bootloaders, :suspend_image_sr, :tags
      
      def initialize(attributes={})
        @uuid ||= 0
        super
      end
      
    end
    
  end
end

require 'fog/model'

module Fog
  module Xenserver

    class Vm < Fog::Model
      # API Reference here:
      # http://docs.vmd.citrix.com/XenServer/5.6.0/1.0/en_gb/api/?c=VM
      # 
      # There are lots of attributes for this model, but we're only going to map what we need/care about.
      
      identity :uuid

      attribute :name
      attribute :description
      attribute :arch
      attribute :cpu
      attribute :memory
      
      attribute :consoles
      attribute :vifs
      attribute :vbds
      
      attribute :is_template
      attribute :is_snapshot
      attribute :is_control_domain
      
      attribute :affinity_uuid
      attribute :metric_uuid

      def initialize(attributes={})
        @uuid ||= 0
        super
      end
      
      # def destroy
      #   requires :id
      #   connection.delete_slice(@id)
      #   true
      # end
      # 
      # def flavor
      #   requires :flavor_id
      #   connection.flavors.get(@flavor_id)
      # end
      # 
      # def image
      #   requires :image_id
      #   connection.images.get(@image_id)
      # end
      # 
      # def ready?
      #   @status == 'active'
      # end
      # 
      # def reboot(type = 'SOFT')
      #   requires :id
      #   connection.reboot_server(@id, type)
      #   true
      # end
      # 
      # def save
      #   requires :flavor_id, :image_id, :name
      #   data = connection.create_slice(@flavor_id, @image_id, @name)
      #   merge_attributes(data.body)
      #   true
      # end

    end

  end
end

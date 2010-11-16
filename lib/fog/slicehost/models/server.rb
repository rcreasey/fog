require 'fog/model'

module Fog
  module Slicehost

    class Server < Fog::Model

      identity :id

      attribute :addresses
      attribute :backup_id,     :aliases => 'backup-id'
      attribute :bandwidth_in,  :aliases => 'bw-in'
      attribute :bandwidth_out, :aliases => 'bw-out'
      attribute :flavor_id,     :aliases => 'flavor-id'
      attribute :image_id,      :aliases => 'image-id'
      attribute :name
      attribute :password,      :aliases => 'root-password'
      attribute :progress
      attribute :status

      def initialize(attributes={})
        @flavor_id ||= 1
        super
      end

      def destroy
        requires :id
        connection.delete_slice(@id)
        true
      end

      def flavor
        requires :flavor_id
        connection.flavors.get(@flavor_id)
      end

      def image
        requires :image_id
        connection.images.get(@image_id)
      end

      def ready?
        @status == 'active'
      end

      def reboot(type = 'SOFT')
        requires :id
        connection.reboot_server(@id, type)
        true
      end

      def save
        requires :flavor_id, :image_id, :name
        data = connection.create_slice(@flavor_id, @image_id, @name)
        merge_attributes(data.body)
        true
      end

    end

  end
end

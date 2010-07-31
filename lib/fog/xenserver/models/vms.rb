require 'fog/collection'
require 'fog/xenserver/models/vm'

module Fog
  module Xenserver

    module Collections
      def vms
        Fog::Xenserver::Vms.new(:connection => self)
      end
    end

    class Vms < Fog::Collection

      model Fog::Xenserver::Vm

      def all
        data = connection.get_blocks.body
        load(data)
      end

      def get(vm_uuid)
        if vm_uuid && vm = connection.get_block(vm_uuid).body
          new(vm)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

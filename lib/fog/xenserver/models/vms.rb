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
        data = connection.get_vms
        load(data)
      end

      def get( vm_name )
        if vm_name && vm = connection.get_vm( vm_name )
          new(vm)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

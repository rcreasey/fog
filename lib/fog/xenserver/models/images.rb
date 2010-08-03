require 'fog/collection'
require 'fog/xenserver/models/vm'

module Fog
  module Xenserver

    module Collections
      def images
        Fog::Xenserver::Images.new(:connection => self)
      end
    end

    class Images < Fog::Collection

      model Fog::Xenserver::Vm

      def all
        data = connection.get_vms
        data.delete_if {|vm| vm[:is_a_template].eql?(false)}
        load(data)
      end

      def get( vm_name )
        if vm_name && vm = connection.get_server( vm_name )
          new(vm)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

require 'fog/collection'
require 'fog/xenserver/models/vm'

module Fog
  module Xenserver

    module Collections
      def servers
        Fog::Xenserver::Servers.new(:connection => self)
      end
    end

    class Servers < Fog::Collection

      model Fog::Xenserver::Vm

      def all
        data = connection.get_vms
        data.delete_if {|vm| vm[:is_a_template]}
        data.delete_if {|vm| vm[:is_control_domain]}
        data.delete_if {|vm| vm[:is_snapshot]}
        load(data)
      end

      def get( vm_ref )
        if vm_ref && vm = connection.get_vm_by_ref( vm_ref )
          new(vm)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

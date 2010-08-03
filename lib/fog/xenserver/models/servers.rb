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

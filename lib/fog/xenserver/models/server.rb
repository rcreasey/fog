require 'fog/xenserver/models/vm'

module Fog
  module Xenserver
    class Server < Fog::Xenserver::Vm
      # this is synonymous with a vm model
      
      def create_server
        create_vm
      end
    end
  end
end

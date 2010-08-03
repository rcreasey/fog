require 'fog/collection'
require 'fog/xenserver/models/network'

module Fog
  module Xenserver

    module Collections
      def networks
        Fog::Xenserver::Networks.new(:connection => self)
      end
    end

    class Networks < Fog::Collection

      model Fog::Xenserver::Network

      def all
        data = connection.get_networks
        load(data)
      end

      def get( network_name )
        if network_name && network = connection.get_server( network_name )
          new(network)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

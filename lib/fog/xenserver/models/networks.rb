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

      def get( network_ref )
        if network_ref && network = connection.get_network_by_ref( network_ref )
          new(network)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

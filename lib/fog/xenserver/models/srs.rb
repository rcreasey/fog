require 'fog/collection'
require 'fog/xenserver/models/sr'

module Fog
  module Xenserver

    module Collections
      def srs
        Fog::Xenserver::Srs.new(:connection => self)
      end
    end

    class Srs < Fog::Collection

      model Fog::Xenserver::Sr

      def all
        data = connection.get_srs
        load(data)
      end

      def get( sr_name )
        if sr_name && sr = connection.get_vm( sr_name )
          new(sr)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end

    end

  end
end

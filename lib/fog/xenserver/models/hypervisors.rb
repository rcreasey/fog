require 'fog/collection'
require 'fog/xenserver/models/host'

module Fog
  module Xenserver
    
    module Collections
      def hypervisors
        Fog::Xenserver::Hypervisors.new(:connection => self)
      end
    end
    
    class Hypervisors < Fog::Collection
      
      model Fog::Xenserver::Host
      
      def all
        data = connection.get_hosts
        load(data)
      end
      
      def get( host_ref )
        if host_ref && host = connection.get_host_by_ref( host_ref )
          new(host)
        end
      rescue Fog::Xenserver::NotFound
        nil
      end
      
    end
    
  end
end

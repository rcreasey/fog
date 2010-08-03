module Fog
  module Xenserver
    extend Fog::Service
    
    require 'fog/xenserver/connection'
    require 'fog/xenserver/utilities'
    require 'fog/xenserver/parser'
    
    requires :xenserver_username
    requires :xenserver_password
    
    model_path 'fog/xenserver/models'
    model 'servers'
    model 'hypervisors'
    model 'images'
    model 'networks'
    model 'srs'
    
    request_path 'fog/xenserver/requests'
    request 'get_vm'
    request 'get_vms'
    request 'get_host'
    request 'get_hosts'
    request 'get_sr'
    request 'get_srs'
    request 'get_network'
    request 'get_networks'
    
    class Real
      include Collections
      
      def initialize(options={})
        @host        = options[:xenserver_pool_master]
        @username    = options[:xenserver_username]
        @password    = options[:xenserver_password]
        @connection  = Fog::Xenserver::Connection.new(@host)
        @connection.authenticate(@username, @password)
      end
      
      def reload
        @connection.authenticate(@username, @password)
      end
      
    end
    
    class Mock
      include Collections

      def self.data
        @data ||= Hash.new do |hash, key|
          hash[key] = {}
        end
      end
      
      def self.reset_data(keys=data.keys)
        for key in [*keys]
          data.delete(key)
        end
      end
      
      def initialize(options={})
        @host        = options[:xenserver_pool_master]
        @username    = options[:xenserver_username]
        @password    = options[:xenserver_password]
        @connection  = Fog::Connection.new(@host)
        @connection.authenticate(@username, @password)
      end
      
    end
  end
end



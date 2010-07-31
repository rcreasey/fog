require 'ruby-debug'

module Fog
  module Xenserver
    extend Fog::Service
    
    requires :xenserver_username
    requires :xenserver_password
    
    model_path 'fog/xenserver/models'
    model 'vm'
    
    request_path 'fog/xenserver/requests'
    request 'get_vms'
    
    class Real
      include Collections
      
      def initialize(options={})
        @host        = options[:xenserver_pool_master]
        @username    = options[:xenserver_username]
        @password    = options[:xenserver_password]
        @connection  = Fog::Connection.new(@host)
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
  
  class Connection
    require 'xmlrpc/client'
    require 'xmlsimple'
    
    def initialize(host)
      @factory = XMLRPC::Client.new(host, '/')
      @factory.set_parser(XMLRPC::XMLParser::REXMLStreamParser.new)
    end
    
    def authenticate( username, password )
      begin
        response = @factory.call('session.login_with_password', username, password )
        raise Fog::Xenserver::InvalidLogin unless response["Status"] =~ /Success/
      end
      @credentials = response["Value"]
    end
    
    def request(params, &block)
      begin
        unless block_given?
          if (parser = params.delete(:parser))
            body = Nokogiri::XML::SAX::Parser.new(parser)
            block = lambda { |chunk| body << chunk }
          end
        end
        
        method   = params.delete(:path)
        response = (params.empty?) ? @factory.call(method, @credentials) : @factory.call(method, params[:params], @credentials)
        
        raise Fog::Xenserver::InvalidRequest unless response.first === ["Status", "Success"]
        
        if parser
          body.parse( XmlSimple.xml_out( response ) )
          response = parser.response
        end
        
        response
      end
    end
  end
end



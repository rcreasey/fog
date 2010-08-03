module Fog
  module Xenserver
    class Connection
      require 'xmlrpc/client'
    
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
    
      def request(options, *params)
        begin
          parser   = options.delete(:parser)
          method   = options.delete(:method)
          
          response = (params.empty?) ? @factory.call(method, @credentials) : eval("@factory.call('#{method}', '#{@credentials}', #{params.map {|p| "'#{p}'"}.join(',')})")
          raise Fog::Xenserver::InvalidRequest unless response.first === ["Status", "Success"]
          
          if parser
            parser.parse( response["Value"] )
            response = parser.response
          end
          
          response
        end
      end
    end
  end
end
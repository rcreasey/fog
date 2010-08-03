module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_host'

      def get_host( name_label )
        host = @connection.request({:parser => Fog::Parsers::Xenserver::GetHost.new, :method => 'host.get_by_name_label'}, name_label)
        @connection.request({:parser => Fog::Parsers::Xenserver::GetHost.new, :method => 'host.get_record'}, host)
      end
      
    end
    
    class Mock
      
      def get_host( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

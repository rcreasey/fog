module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parser'

      def get_host( name_label )
        host_ref = @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'host.get_by_name_label'}, name_label)
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'host.get_record'}, host_ref)
      end
      
    end
    
    class Mock
      
      def get_host( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

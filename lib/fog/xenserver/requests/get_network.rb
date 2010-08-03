module Fog
  module Xenserver
    class Real
      
      require 'fog/xenserver/parser'
      
      def get_network( name_label )
        network_ref = @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'network.get_by_name_label'}, name_label)
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'network.get_record'}, network_ref)
      end
      
    end
    
    class Mock
      
      def get_network( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parser'

      def get_sr( uuid )
        sr_uuid = @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'SR.get_by_uuid'}, uuid)
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'SR.get_record'}, sr_uuid)
      end
      
    end
    
    class Mock
      
      def get_sr( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

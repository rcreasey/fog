module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_sr'

      def get_sr( uuid )
        sr_uuid = @connection.request({:parser => Fog::Parsers::Xenserver::GetSr.new, :method => 'SR.get_by_uuid'}, uuid)
        @connection.request({:parser => Fog::Parsers::Xenserver::GetSr.new, :method => 'SR.get_record'}, sr_uuid)
      end
      
    end
    
    class Mock
      
      def get_sr( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

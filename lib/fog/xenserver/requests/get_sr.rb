module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parser'

      def get_sr( name_label )
        sr_ref = @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'SR.get_by_name_label'}, name_label)
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'SR.get_record'}, sr_ref)
      end
      
    end
    
    class Mock
      
      def get_sr( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

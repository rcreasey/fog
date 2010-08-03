module Fog
  module Xenserver
    class Real
      
      require 'fog/xenserver/parser'
      
      def get_vif( name_label )
        vif_ref = @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'VIF.get_by_name_label'}, name_label)
        get_vif_by_ref( vif_ref )
      end
      
      def get_vif_by_ref( opaque_ref )
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'VIF.get_record'}, opaque_ref)
      end
      
    end
    
    class Mock
      
      def get_vif( uuid )
        Fog::Mock.not_implemented
      end

      def get_vif_by_ref( uuid )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

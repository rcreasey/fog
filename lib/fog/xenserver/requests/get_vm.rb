module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_vm'

      def get_vm
        @connection.request(
          :parser   => Fog::Parsers::Xenserver::GetVms.new,
          :path     => 'VM.get_all_records'
        )
      end
      
      def get_vm_by_name( name_label )
        @connection.request(
          :parser   => Fog::Parsers::Xenserver::GetVms.new,
          :path     => 'VM.get_by_name_label'
        )
      end
      
    end
    
    class Mock
      
      def get_vm
        Fog::Mock.not_implemented
      end
      
      def get_vm_by_name( name_label )
        Fog::Mock.not_implemented
      end
    end
  end
end

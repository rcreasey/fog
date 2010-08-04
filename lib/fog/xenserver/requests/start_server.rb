module Fog
  module Xenserver
    class Real
      
      def start_server( vm_ref, force = false )
        start_vm( vm_ref, force )
      end
      
    end
    
    class Mock
      
      def start_server( vm_ref )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

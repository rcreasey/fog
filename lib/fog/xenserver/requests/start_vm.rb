module Fog
  module Xenserver
    class Real
      
      def start_vm( vm_ref, force = false )
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'VM.start'}, vm_ref, force)
      end
      
    end
    
    class Mock
      
      def start_vm( vm_ref )
        Fog::Mock.not_implemented
      end
      
    end
  end
end

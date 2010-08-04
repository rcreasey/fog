module Fog
  module Xenserver
    class Real
      
      def create_vm( name_label, image = nil, network = nil )
        image   ||= default_image
        network ||= default_network
        
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'VM.clone'}, image.reference, name_label)
        new_vm = Fog::Xenserver::Vm.new(get_vm( name_label ))
        create_vif( new_vm.reference, network.reference )
        @connection.request({:parser => Fog::Parsers::Xenserver::Base.new, :method => 'VM.provision'}, new_vm.reference)
        
        get_vm_by_ref( new_vm.reference )
      end
      
    end
    
    class Mock
      
      def create_vm()
        Fog::Mock.not_implemented
      end
      
    end
  end
end

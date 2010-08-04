module Fog
  module Xenserver
    class Real

      def create_server( name_label )
        create_vm( name_label )
      end

    end

    class Mock

      def create_server()
        Fog::Mock.not_implemented
      end

    end
  end
end

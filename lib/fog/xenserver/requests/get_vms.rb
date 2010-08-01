module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_vms'

      def get_vms
        @connection.request(
          :parser   => Fog::Parsers::Xenserver::GetVms.new,
          :path     => 'VM.get_all_records'
        )
      end

    end

    class Mock

      def get_vms
        Fog::Mock.not_implemented
      end

    end
  end
end

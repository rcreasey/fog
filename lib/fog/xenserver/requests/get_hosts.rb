module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_hosts'

      def get_hosts
        @connection.request(:parser => Fog::Parsers::Xenserver::GetHosts.new, :method => 'host.get_all_records')
      end

    end

    class Mock

      def get_hosts
        Fog::Mock.not_implemented
      end

    end
  end
end

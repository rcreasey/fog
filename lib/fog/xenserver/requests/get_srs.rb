module Fog
  module Xenserver
    class Real

      require 'fog/xenserver/parsers/get_srs'

      def get_srs
        @connection.request(:parser => Fog::Parsers::Xenserver::GetSrs.new, :method => 'SR.get_all_records')
      end

    end

    class Mock

      def get_srs
        Fog::Mock.not_implemented
      end

    end
  end
end

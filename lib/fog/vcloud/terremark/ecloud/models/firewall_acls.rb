module Fog
  module Vcloud
    module Terremark
      module Ecloud

        class FirewallAcls < Fog::Vcloud::Collection

          model Fog::Vcloud::Terremark::Ecloud::FirewallAcl

          attribute :href, :aliases => :Href

          def all
            if data = connection.get_firewall_acls(href).body[:FirewallAcl]
              data = [ data ] if data.is_a?(Hash)
              load(data)
            end
          end

          def get(uri)
            if data = connection.get_firewall_acl(uri).body
              new(data)
            end
          rescue Fog::Errors::NotFound
            nil
          end

        end
      end
    end
  end
end

module Fog
  module Vcloud
    module Terremark
      module Ecloud
        class PublicIp < Fog::Vcloud::Model

          identity :href, :Href

          ignore_attributes :xmlns, :xmlns_i

          attribute :name, :aliases => :Name
          attribute :id, :aliases => :Id

          def internet_services
            load_unless_loaded!
            @internet_services ||= Fog::Vcloud::Terremark::Ecloud::InternetServices.
              new( :connection => connection,
                   :href => href.to_s + "/internetServices" )
          end
        end
      end
    end
  end
end


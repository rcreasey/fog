require 'fog/model'

module Fog
  module AWS
    module EC2

      class Server < Fog::Model

        identity  :id,                    :aliases => 'instanceId'

        attr_accessor :architecture
        attribute :ami_launch_index,      :aliases => 'amiLaunchIndex'
        attribute :availability_zone,     :aliases => 'availabilityZone'
        attribute :block_device_mapping,  :aliases => 'blockDeviceMapping'
        attribute :dns_name,              :aliases => 'dnsName'
        attribute :groups
        attribute :flavor_id,             :aliases => 'instanceType'
        attribute :image_id,              :aliases => 'imageId'
        attribute :ip_address,            :aliases => 'ipAddress'
        attribute :kernel_id,             :aliases => 'kernelId'
        attribute :key_name,              :aliases => 'keyName'
        attribute :created_at,            :aliases => 'launchTime'
        attribute :monitoring
        attribute :product_codes,         :aliases => 'productCodes'
        attribute :private_dns_name,      :aliases => 'privateDnsName'
        attribute :private_ip_address,    :aliases => 'privateIpAddress'
        attribute :ramdisk_id,            :aliases => 'ramdiskId'
        attribute :reason
        attribute :root_device_name,      :aliases => 'rootDeviceName'
        attribute :root_device_type,      :aliases => 'rootDeviceType'
        attribute :state,                 :aliases => 'instanceState'
        attribute :subnet_id,             :aliases => 'subnetId'
        attribute :user_data

        def initialize(attributes={})
          @groups ||= ["default"] unless attributes[:subnet_id]
          @flavor_id ||= 'm1.small'
          super
        end

        def addresses
          requires :id

          connection.addresses(:server => self)
        end

        def console_output
          requires :id

          connection.get_console_output(@id)
        end

        def destroy
          requires :id

          connection.terminate_instances(@id)
          true
        end

        # def security_group
        #   connection.security_groups.all(@group_id)
        # end
        #
        # def security_group=(new_security_group)
        #   @group_id = new_security_group.name
        # end

        def flavor_id
          @flavor && @flavor.id || @flavor_id
        end

        def flavor=(new_flavor)
          @flavor = new_flavor
        end

        def flavor
          @flavor ||= connection.flavors.all.detect {|flavor| flavor.id == @flavor_id}
        end

        def key_pair
          requires :key_name

          connection.keypairs.all(@key_name).first
        end

        def key_pair=(new_keypair)
          @key_name = new_keypair.name
        end

        def monitoring=(new_monitoring)
          if new_monitoring.is_a?(Hash)
            @monitoring = new_monitoring['state']
          else
            @monitoring = new_monitoring
          end
        end

        def placement=(new_placement)
          if new_placement.is_a?(Hash)
            @availability_zone = new_placement['availabilityZone']
          else
            @availability_zone = new_placement
          end
        end

        def ready?
          @state == 'running'
        end

        def reboot
          requires :id
          connection.reboot_instances(@id)
          true
        end

        def save
          requires :image_id

          options = {
            'BlockDeviceMapping'          => @block_device_mapping,
            'InstanceType'                => flavor_id,
            'KernelId'                    => @kernel_id,
            'KeyName'                     => @key_name,
            'Monitoring.Enabled'          => @monitoring,
            'Placement.AvailabilityZone'  => @availability_zone,
            'RamdiskId'                   => @ramdisk_id,
            'SecurityGroup'               => @groups,
            'SubnetId'                    => subnet_id,
            'UserData'                    => @user_data
          }
          
          # If subnet is defined we are working on a virtual private cloud.
          # subnet & security group cannot co-exist. I wish VPC just ignored
          # the security group parameter instead, it would be much easier!
          if subnet_id
            options.delete('SecurityGroup')
          else
            options.delete('SubnetId')
          end

          data = connection.run_instances(@image_id, 1, 1, options)
          merge_attributes(data.body['instancesSet'].first)
          true
        end

        def start
          requires :id
          connection.start_instances(@id)
          true
        end

        def stop
          requires :id
          connection.stop_instances(@id)
          true
        end

        def volumes
          requires :id

          connection.volumes(:server => self)
        end

        private

        def state=(new_state)
          if new_state.is_a?(Hash)
            @state = new_state['name']
          else
            @state = new_state
          end
        end

      end

    end
  end
end

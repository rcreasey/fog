require 'rubygems'
require 'base64'
require 'cgi'
require 'digest/md5'
require 'excon'
require 'formatador'
require 'json'
require 'mime/types'
require 'net/ssh'
require 'nokogiri'
require 'time'

__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'fog/attributes'
require 'fog/collection'
require 'fog/connection'
require 'fog/deprecation'
require 'fog/errors'
require 'fog/hmac'
require 'fog/model'
require 'fog/parser'
require 'fog/service'
require 'fog/ssh'

require 'fog/aws'
require 'fog/bluebox'
require 'fog/go_grid'
require 'fog/linode'
require 'fog/local'
require 'fog/new_servers'
require 'fog/rackspace'
require 'fog/slicehost'
require 'fog/terremark'
require 'fog/vcloud'
require 'fog/xenserver'

module Fog

  unless const_defined?(:VERSION)
    VERSION = '0.2.28'
  end

  module Mock
    @delay = 1
    def self.delay
      @delay
    end

    def self.delay=(new_delay)
      raise ArgumentError, "delay must be non-negative" unless new_delay >= 0
      @delay = new_delay
    end

    def self.not_implemented
      raise Fog::Errors::MockNotImplemented.new("Contributions welcome!")
    end

  end

  def self.mock!
    @mocking = true
  end

  def self.mocking?
    !!@mocking
  end

  def self.wait_for(timeout=600, interval=1, &block)
    duration = 0
    start = Time.now
    until yield || duration > timeout
      sleep(interval)
      duration = Time.now - start
    end
    if duration > timeout
      false
    else
      { :duration => duration }
    end
  end

end

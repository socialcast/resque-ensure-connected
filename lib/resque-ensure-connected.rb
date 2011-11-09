require 'active_record'
require 'resque'
require "resque-ensure-connected/version"

module Resque
  module EnsureConnected
    def self.verify_active_connections
        ActiveRecord::Base.connection_handler.verify_active_connections!
    end
  end
end
Resque.after_fork do |job|
  Resque::EnsureConnected.verify_active_connections
end

require 'active_record'

module Resque
  module Plugin
    module EnsureConnected
      def before_work
        ActiveRecord::Base.connection_handler.verify_active_connections!
      end
    end
  end
end
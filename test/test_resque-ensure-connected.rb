require 'helper'

class TestResqueEnsureConnected < Test::Unit::TestCase
  class FakeJob
    @queue = 'test'
    def self.perform
    end
  end

  should "ensure verify connections after forking process" do
    Resque.redis.flushall
    workerA = Resque::Worker.new(:jobs)
    Resque::Job.create(:jobs, FakeJob, 20, '/tmp')

    handler = mock 'handler', :verify_active_connections! => nil
    ActiveRecord::Base.connection_handler = handler
    workerA.work(0)
  end
end

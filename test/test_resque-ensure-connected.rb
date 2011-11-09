require 'helper'

class TestResqueEnsureConnected < Test::Unit::TestCase
  class FakeJob
    @queue = 'test'
    def self.perform(foo, bar)
    end
  end

  class FakeHandler
    @invoked = false
    def verify_active_connections!
      @invoked = true
    end
    def invoked?
      @invoked
    end
  end

  should "ensure verify connections after forking process" do
    Resque.reset!
    worker = Resque::Worker.new(:jobs)
    Resque::Job.create(:jobs, FakeJob, 20, '/tmp')

    handler = FakeHandler.new
    ActiveRecord::Base.connection_handler = handler

    Resque.after_fork.call

    assert handler.invoked?
  end
end

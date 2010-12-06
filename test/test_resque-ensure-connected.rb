require 'helper'

class TestResqueEnsureConnected < Test::Unit::TestCase
  should 'lint' do
    assert_nothing_raised do
      Resque::Plugin.lint(Resque::Plugin::EnsureConnected)
    end
  end
end

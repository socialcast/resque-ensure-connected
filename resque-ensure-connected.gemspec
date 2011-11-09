# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "resque-ensure-connected/version"

Gem::Specification.new do |s|
  s.name        = "resque-ensure-connected"
  s.version     = Resque::EnsureConnected::VERSION
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@socialcast.com"]
  s.homepage    = ""
  s.summary     = %q{ensure active record connections are valid before performing work}
  s.description = %q{ensure active record connections are valid before performing resque background jobs}

  s.rubyforge_project = "resque-ensure-connected"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<resque>, [">= 1.10.0"])
  s.add_runtime_dependency(%q<activerecord>, [">= 2.3.5"])
  s.add_development_dependency(%q<shoulda>, [">= 0"])
  s.add_development_dependency(%q<mocha>, [">= 0"])
  s.add_development_dependency(%q<resque_unit>, ["0.4.1"])
  s.add_development_dependency(%q<rake>, ["0.9.2.2"])
end

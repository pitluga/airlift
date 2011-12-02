# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hercules/version"

Gem::Specification.new do |s|
  s.name        = "lorrie"
  s.version     = Hercules::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tony Pitluga"]
  s.email       = ["tony.pitluga@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{data center management}
  s.description = %q{manage multiple applications and data centers with puppet and capistrano}

  s.rubyforge_project = "lorrie"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency "capistrano", "~> 2.9"
  s.add_dependency "supply_drop", "~> 0.4"
  s.add_dependency "thor", "~> 0.14"
  s.add_dependency "hiera", "~> 0.2"
  s.add_development_dependency "rspec", "2.5.0"
end

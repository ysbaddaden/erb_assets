# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "erb_assets/version"

Gem::Specification.new do |s|
  s.name        = "erb_assets"
  s.version     = ErbAssets::VERSION
  s.authors     = ["Julien Portalier"]
  s.email       = ["julien@portalier.com"]
  s.homepage    = "https://github.com/ysbaddaden/erb_assets"
  s.summary     = %q{Use Erb with Rails helpers in the asset pipeline}
  s.description = %q{Use Erb with Rails helpers in the asset pipeline}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency "tilt"

  s.add_development_dependency 'rails', '>= 3.1.0'
  s.add_development_dependency 'minitest'
end

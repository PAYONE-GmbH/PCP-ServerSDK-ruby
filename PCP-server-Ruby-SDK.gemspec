# -*- encoding: utf-8 -*-


$:.push File.expand_path("../lib", __FILE__)
require "PCP-server-Ruby-SDK/version"

Gem::Specification.new do |s|
  s.name        = "pcp-server-ruby-sdk"
  s.version     = PCPServerSDK::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["PAYONE GmbH"]
  s.email       = [""]
  s.homepage    = "https://github.com/PAYONE-GmbH/PCP-ServerSDK-ruby"
  s.summary     = "Commerce Platform API Ruby Gem"
  s.description = "RESTful API for the creation of Commerce Cases with Checkouts and the execution of Payments. "
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0"
  s.metadata = {}

  s.add_runtime_dependency 'net-http'
  s.add_runtime_dependency 'json'
  s.add_runtime_dependency 'openssl'
  s.add_runtime_dependency 'base64'

  s.add_development_dependency 'simplecov', '~> 0.22.0' 

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find test/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end

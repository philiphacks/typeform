# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typeform/version'

Gem::Specification.new do |spec|
  spec.name          = "typeform"
  spec.version       = Typeform::VERSION
  spec.authors       = ["Philip De Smedt"]
  spec.email         = ["philip.desmedt@gmail.com"]
  spec.summary       = "A Ruby interface to the Typeform Data API"
  spec.description   = "Implements the complete functionality of the Typeform Data API v0"
  spec.homepage      = "https://github.com/philipdesmedt/typeform"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_runtime_dependency "hashie", "~> 3.0.0"
  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "json"
end

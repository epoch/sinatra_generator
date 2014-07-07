# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra_generator"
  spec.version       = SinatraGenerator::VERSION
  spec.authors       = ["Daniel Tsui"]
  spec.email         = ["tsui.daniel@gmail.com"]
  spec.summary       = %q{Generate a simple hello world sinatra app}
  spec.description   = %q{Intended as a quick demo on how to make a ruby gem. Generate a simple hello world sinatra app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['sinatra']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.3.4"
  spec.add_development_dependency 'simplecov', '~> 0.7.1'

  spec.add_runtime_dependency 'thor', '~> 0.19'
end

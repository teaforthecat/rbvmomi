# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbvmomi/version'

Gem::Specification.new do |spec|
  spec.name          = "rbvmomi"
  spec.version       = Rbvmomi::VERSION
  spec.authors       = ["Chris Thompson"]
  spec.email         = ["chris.thompson@govdelivery.com"]
  spec.summary       = %q{ Vsphere client via soap api's }
  spec.description   = %q{ Vsphere client via soap api's }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "trollop"
  spec.add_dependency "builder"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end

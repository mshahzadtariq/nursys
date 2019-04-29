# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nursys/version'

Gem::Specification.new do |spec|
  spec.name          = "nursys"
  spec.version       = Nursys::VERSION
  spec.authors       = ["Shahzad Tariq"]
  spec.email         = ["m.shahzad.tariq@hotmail.com"]

  spec.summary       = %q{Ruby wrapper for Nursys License Verification API}
  spec.description   = %q{Ruby wrapper for Nursys License Verification API. This is developed by reading Nursys API documentation to help open source community. This is not official ruby wrapper of Nursys nor developed by Nursys.}
  spec.homepage      = "https://github.com/mshahzadtariq/nursys"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'savon'
  spec.add_dependency 'nokogiri'
end

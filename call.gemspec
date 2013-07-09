# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'call/version'

Gem::Specification.new do |spec|
  spec.name          = "call"
  spec.version       = Call::VERSION
  spec.authors       = ["Jakob Holderbaum"]
  spec.email         = ["jh@neopoly.de"]
  spec.summary       = %q{Callback-Trigger-Pingpong for clean DCI implementation.}
  spec.homepage      = "https://github.com/neopoly/call"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

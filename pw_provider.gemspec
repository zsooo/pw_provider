# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pw_provider/version'

Gem::Specification.new do |spec|
  spec.name          = "pw_provider"
  spec.version       = PwProvider::VERSION
  spec.authors       = ["Zsolt Kecskemeti"]
  spec.email         = ["zsooo@zsooo.org"]
  spec.summary       = %q{Password provider}
  spec.description   = %q{Originally created for tests that require SSL certs with passphrases}
  spec.homepage      = "http://rubygems.org/gems/pw_provider"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  
end

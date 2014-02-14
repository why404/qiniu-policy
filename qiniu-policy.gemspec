# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qiniu/policy/version'

Gem::Specification.new do |spec|
  spec.name          = "qiniu-policy"
  spec.version       = Qiniu::Policy::VERSION
  spec.authors       = ["why404"]
  spec.email         = ["awhy.xu@gmail.com"]
  spec.summary       = %q{Qiniu GET/PUT authorization library.}
  spec.description   = %q{Authorization library used to generate upload/download tokens of Qiniu Cloud Storage.}
  spec.homepage      = "https://github.com/why404/qiniu-policy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "qiniu-kit", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
end

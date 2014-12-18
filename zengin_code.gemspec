# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zengin_code/version'

Gem::Specification.new do |spec|
  spec.name          = "zengin_code"
  spec.version       = ZenginCode::VERSION
  spec.authors       = ["Sho Kusano"]
  spec.email         = ["rosylilly@aduca.org"]
  spec.summary       = %q{bank codes and branch codes for japanese}
  spec.description   = %q{bank codes and branch codes for japanese}
  spec.homepage      = "https://github.com/rosylilly/zengin_code"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rubyzip', '~> 1.1.6'
  spec.add_development_dependency 'moji', '~> 1.6'
  spec.add_development_dependency 'romaji', '~> 0.2.1'
end

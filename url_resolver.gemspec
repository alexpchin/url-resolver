# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_resolver/version'

Gem::Specification.new do |spec|
  spec.name          = "url_resolver"
  spec.version       = UrlResolver::VERSION
  spec.authors       = ["Alex Chin"]
  spec.email         = ["alex@alexchin.co.uk"]
  spec.summary       = %q{This gem helps to resolve an absolute path for a file.}
  spec.description   = %q{This gem returns a filepath for files linked to using //, http://, or using a relative file path /.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

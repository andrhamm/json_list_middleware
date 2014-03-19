# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_list_middleware/version'

Gem::Specification.new do |spec|
  spec.name          = "json_list_middleware"
  spec.version       = JsonListMiddleware::VERSION
  spec.authors       = ["Andrew Hammond"]
  spec.email         = ["andrew@evertrue.com"]
  spec.description   = %q{Rack middleware to wrap incoming JSON list data in an array.}
  spec.summary       = %q{Rack middleware to wrap incoming JSON list data in an array.}
  spec.homepage      = "http://github.com/andrhamm/json_list_middleware"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

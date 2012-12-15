# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fake_enum/version'

Gem::Specification.new do |gem|
  gem.name          = "fake_enum"
  gem.version       = FakeEnum::VERSION
  gem.authors       = ["Flip Studio"]
  gem.email         = ["contato@flipstudio.net"]
  gem.description   = "Gem description"
  gem.summary       = "Gem summary"
  gem.homepage      = "https://github.com/flipstudio/fake_enum"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

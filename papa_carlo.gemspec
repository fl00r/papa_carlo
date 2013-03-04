# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'papa_carlo/version'

Gem::Specification.new do |gem|
  gem.name          = "papa_carlo"
  gem.version       = PapaCarlo::VERSION
  gem.authors       = ["Petr Yanovich"]
  gem.email         = ["fl00r@yandex.ru"]
  gem.description   = %q{Create new Ruby project}
  gem.summary       = %q{Create new Ruby project}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

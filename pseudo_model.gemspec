# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pseudo_model/version'

Gem::Specification.new do |gem|
  gem.name          = "pseudo_model"
  gem.version       = PseudoModel::VERSION
  gem.authors       = ["Stefan Huska"]
  gem.email         = ["stefan.huska@gmail.com"]
  gem.description   = %q{Use ActiveRecord Validations in any class}
  gem.summary       = %q{Model-like validations in any class}
  gem.homepage      = "https://github.com/kelso/pseudo_model"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'activemodel', '~> 3.2'
end

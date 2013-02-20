# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ohajiki/version'

Gem::Specification.new do |gem|
  gem.name          = "ohajiki"
  gem.version       = Ohajiki::VERSION
  gem.authors       = ["Keisuke KITA"]
  gem.email         = ["kei.kita2501@gmail.com"]
  gem.description   = %q{minimum dropbox clone}
  gem.summary       = %q{minimum dropbox clone}
  gem.homepage      = "https://github.com/kitak/ohajiki"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'grit'
  gem.add_runtime_dependency 'daemons'
end

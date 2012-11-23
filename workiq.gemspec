# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workiq/version'

Gem::Specification.new do |gem|
  gem.name          = "workiq"
  gem.version       = Workiq::VERSION
  gem.authors       = ["Moustafa Badawy"]
  gem.email         = ["moustafa@rubikal.com"]
  gem.description   = %q{Workiq adds Sidekiq middlewares to track a job worker status. Status values are :queued, :working, :complete, and :failed}
  gem.summary       = %q{Track Sidekiq job worker status}
  gem.homepage      = ""

  gem.add_dependency 'sidekiq', '~>2.5.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

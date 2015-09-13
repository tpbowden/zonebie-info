require File.expand_path('../lib/zonebie/info/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tom Bowden']
  gem.email         = ['tom.b1992@gmail.com']
  gem.description   = 'Add info from Wikipedia to your Zonebie output'
  gem.summary = 'Add info from Wikipedia to your Zonebie output'
  gem.homepage      = 'https://github.com/tpbowden/zonebie-info'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.name          = 'zonebie-info'
  gem.require_paths = ['lib']
  gem.version       = Zonebie::Info::VERSION

  gem.add_dependency 'zonebie', '~> 0.5.1'
  gem.add_dependency 'wikipedia-client', '~> 1.5.0'

  gem.add_development_dependency 'activesupport', '>= 2.3'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubocop', '~> 0.34.1'
  gem.add_development_dependency 'simplecov', '~> 0.10.0'
end

require File.expand_path('../lib/zonebie/info/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tom Bowden']
  gem.email         = ['tom.b1992@gmail.com']
  gem.summary       = 'Add info from Wikipedia to your Zonebie output'
  gem.description   = 'Downloads the first paragraph from wikipedia about the randomly set timezone'
  gem.homepage      = 'https://github.com/tpbowden/zonebie-info'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.name          = 'zonebie-info'
  gem.require_paths = ['lib']
  gem.version       = Zonebie::Info::VERSION

  gem.add_dependency 'zonebie', '~> 0.5', '>= 0.5.1'
  gem.add_dependency 'wikipedia-client', '~> 1.5', '>= 1.5.0'

  gem.add_development_dependency 'activesupport', '~> 4.2', '>= 4.2.4'
  gem.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  gem.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  gem.add_development_dependency 'rubocop', '~> 0.34', '>= 0.34.1'
  gem.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10.0'
end

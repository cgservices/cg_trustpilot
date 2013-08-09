Gem::Specification.new do |gem|
  gem.authors       = ['Arno Geurts']
  gem.email         = ['arno@cg.nl']
  gem.description   = 'Library for implementing TrustPilot'
  gem.summary       = 'TrustPilot feed gem'
  gem.homepage      = 'http://www.cg.nl'

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'cg_trustpilot'
  gem.require_paths = ['lib']
  gem.version       = "0.0.2"

  gem.add_dependency('activesupport', ['>= 0'])
  gem.add_dependency('json', ['>= 0'])
  gem.add_development_dependency('rake', ['>= 0'])
  gem.add_development_dependency('rspec', ['>= 0'])
end

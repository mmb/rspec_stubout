# encoding: UTF-8

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rspec_stubout/version'

Gem::Specification.new do |s|
  s.name = 'rspec_stubout'
  s.version = RspecStubout::VERSION
  s.summary = 'Fail RSpec specs that stub the object under test.'
  s.description = s.summary
  s.homepage = 'https://github.com/mmb/rspec_stubout'
  s.authors = ['Matthew M. Boedicker']
  s.email = %w{matthewm@boedicker.org}
  s.license = 'MIT'

  s.add_dependency 'rspec'

  s.add_development_dependency 'rake'

  s.files = `git ls-files`.split("\n")
end

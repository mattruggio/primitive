# frozen_string_literal: true

require './lib/primitive/version'

Gem::Specification.new do |s|
  s.name        = 'primitive'
  s.version     = Primitive::VERSION
  s.summary     = 'Root objects used in object modeling within a domain context.'
  s.description = 'The most reusable components from several domain-focused libraries will be extracted here as a common consumption point.'

  s.authors     = ['Matthew Ruggio']
  s.email       = ['mattruggio@icloud.com']
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir      = 'exe'
  s.executables = %w[]
  s.homepage    = 'https://github.com/mattruggio/primitive'
  s.license     = 'MIT'
  s.metadata    = {
    'bug_tracker_uri' => 'https://github.com/mattruggio/primitive/issues',
    'changelog_uri' => 'https://github.com/mattruggio/primitive/blob/main/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/primitive',
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = '>= 2.7.6'

  s.add_runtime_dependency('sorbet-runtime')

  s.add_development_dependency('bundler-audit')
  s.add_development_dependency('guard-rspec')
  s.add_development_dependency('pry')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('rubocop')
  s.add_development_dependency('rubocop-rake')
  s.add_development_dependency('rubocop-rspec')
  s.add_development_dependency('rubocop-sorbet')
  s.add_development_dependency('simplecov')
  s.add_development_dependency('simplecov-console')
  s.add_development_dependency('sorbet')
  s.add_development_dependency('tapioca')
end

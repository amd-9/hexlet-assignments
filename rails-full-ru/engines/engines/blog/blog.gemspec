# frozen_string_literal: true

require_relative 'lib/blog/version'

Gem::Specification.new do |spec|
  spec.name        = 'blog'
  spec.version     = Blog::VERSION
  spec.authors     = ['']
  spec.email       = ['']
  spec.homepage    = 'http://blog.local'
  spec.summary     = 'Simple Blog Engine.'
  spec.description = 'Description of Blog.'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://blog.local'
  spec.metadata['changelog_uri'] = 'http://blog.local.'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.4.3'
  spec.metadata['rubygems_mfa_required'] = 'true'
end

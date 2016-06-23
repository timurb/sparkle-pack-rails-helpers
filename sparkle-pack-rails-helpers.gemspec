Gem::Specification.new do |s|
  s.name = 'sparkle-pack-rails-helpers'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = 'SparklePack to use while deploying Rails app'
  s.description = 'Generate DATABASE_URL and such'
  s.authors = ['Timur Batyrshin']
  s.email = 'erthad@gmail.com'
  s.homepage = 'https://github.com/timurb/sparkle-pack-rails-helpers'
  s.files = Dir[ 'lib/sparkleformation/registry/*' ] + %w(sparkle-pack-rails-helpers.gemspec lib/sparkle-pack-rails-helpers.rb)
end

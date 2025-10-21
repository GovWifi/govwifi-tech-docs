ruby File.read(".ruby-version").strip
# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.1', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

# Include the tech docs gem
# pinned to 4.2.0 due to higher versions pinning middleman to 4.5.1
gem 'govuk_tech_docs', '4.2.0'

# Middleman Gems
gem 'middleman', '4.6.2'

# required since ruby > 3.4
gem 'base64'
gem 'benchmark'
gem 'bigdecimal'
gem 'mutex_m'
gem 'rdoc'
gem 'kramdown' ## replace redcarpet which breaks with middleman > 4.5.1
gem 'kramdown-parser-gfm' ## needed for github style markdown
gem 'tilt'
## needed if sass-embedded gives a seg fault.
# gem 'google-protobuf', force_ruby_platform: true if RUBY_PLATFORM.include?('linux-musl')
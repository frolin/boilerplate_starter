source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

group :core do
  gem 'rake'
  gem 'padrino', :git => 'https://github.com/frolin/padrino-framework.git', :branch => '0.12'
  gem 'puma'
  gem 'activerecord', '>= 3.1', :require => 'active_record'
  gem 'bcrypt'
  gem 'erubis', '~> 2.7.0'
  gem 'sqlite3'
end

group :assets do
  gem 'sinatra-assetpack', :require => 'sinatra/assetpack', git: 'https://github.com/frolin/sinatra-assetpack.git'
  gem 'sass'
  gem 'haml'

end

group :development do
  gem 'capistrano'
end


group :production do
  gem 'pg'
  gem 'unicorn'

  gem 'uglifier', '2.1.1'
  gem 'yui-compressor', '0.9.6'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end


# Padrino Stable Gem

#Assets


# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.0.beta2'
# end

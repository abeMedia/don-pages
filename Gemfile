# For Rails Assets
require File.expand_path('../lib/don-pages/assets', __FILE__)
gem 'bundler'

source 'https://rubygems.org'
gemspec

source 'https://rails-assets.org' do
  DonPages::ASSETS.each do |asset, version|
    gem "rails-assets-#{asset}", version
  end
end

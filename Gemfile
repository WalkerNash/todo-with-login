# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'sinatra-reloader'
gem 'rspec'
gem 'rack'
gem 'rack-test'

# active record dependencies
gem 'activerecord'
gem 'sinatra-activerecord'
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
gem 'rake'

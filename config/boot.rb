require "bundler"

ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
Bundler.setup(:default, (ENV['APP_ENV'] || 'development').to_sym)

require File.expand_path('../../lib/papa_carlo', __FILE__)
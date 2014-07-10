ENV["RAILS_ENV"] = "test"
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "bundler"
Bundler.setup(:default, :test)

require "minitest/autorun"
require "dummy/config/environment"
require "erb_assets"

require "bundler/gem_tasks"

task :test do
  system "rm -rf test/dummy/tmp"
  system "bundle exec ruby -Itest ./test/erb_assets_test.rb"
end

task :default => :test

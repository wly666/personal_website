ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'rubygems'
require 'rufus/scheduler'
require 'rails'
require 'uri'
scheduler = Rufus::Scheduler.new

scheduler.every '2s' do
	# 每隔180s执行
puts "2s执行"
end

scheduler.join

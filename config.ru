require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'

Bundler.require :default, ENV['RACK_ENV'].to_sym

require './config/app'

run Checkr
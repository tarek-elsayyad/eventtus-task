# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

# require File.expand_path('../application', __FILE__)

# use ActiveRecord::ConnectionAdapters::ConnectionManagement

# run Eventtus
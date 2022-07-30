# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails'
  puts 'required simplecov'
end

require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)
    include Devise::Test::IntegrationHelpers
  end
end

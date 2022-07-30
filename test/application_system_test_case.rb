# frozen_string_literal: true

require 'test_helper'
require 'helpers/login_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome
  include Warden::Test::Helpers
  include LoginHelper
end

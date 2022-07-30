# frozen_string_literal: true

require 'test_helper'

# user test
class UserTest < ActiveSupport::TestCase
  fixtures :users

  setup do
    @user = users(:user)
    @name = 'cesar'
  end

  test 'display_name full name' do
    assert_equal @user.display_name, "#{@user.first_name} #{@user.last_name}"
  end

  test 'display_name as email' do
    @user.first_name = nil
    @user.last_name = nil
    assert_equal @user.display_name, @name
  end
end

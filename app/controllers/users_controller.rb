# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: :show

  def current
    follows_for current_user
    render :show
  end

  def show
    follows_for @user
  end

  private

  def follows_for(user)
    @followers = user.followers
    @followings = user.followings
  end

  def find_user
    @user = User.find(params[:id])
  end
end

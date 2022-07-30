# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :followee_follows, foreign_key: :followee_id, inverse_of: :following, class_name: 'Follow'
  has_many :followers, through: :followee_follows

  has_many :follower_follows, foreign_key: :follower_id, inverse_of: :follower, class_name: 'Follow'
  has_many :followings, through: :follower_follows

  def display_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email.split('@')[0]
    end
  end
end

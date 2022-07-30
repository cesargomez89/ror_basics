# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  def display_name
    if first_name && last_name
      "#{first_name} #{last_name}"
    else
      email.split('@')[0]
    end
  end
end

# frozen_string_literal: true

class Post < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
end

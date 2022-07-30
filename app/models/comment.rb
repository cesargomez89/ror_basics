# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true

  has_many :likes, as: :likable

  belongs_to :user, optional: true
end

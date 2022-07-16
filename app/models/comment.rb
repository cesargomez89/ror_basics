class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :content

  has_many :likes, as: :likable

  belongs_to :user, optional: true
end

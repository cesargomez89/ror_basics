class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :user, optional: true
  has_many :comments
  has_many :likes, as: :likable
end

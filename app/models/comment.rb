class Comment < ApplicationRecord
  belongs_to :post
  validates_presence_of :content

  belongs_to :user, optional: true
end

# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :following, class_name: 'User', foreign_key: :followee_id
  belongs_to :follower, class_name: 'User'
end

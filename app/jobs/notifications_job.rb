# frozen_string_literal: true

class NotificationsJob < ApplicationJob
  def perform(post_user_id, comment_id, current_user_id)
    post_user = User.find(post_user_id)
    comment = Comment.find(comment_id)
    current_user = User.find(current_user_id)

    NotificationsMailer.with(
      user: post_user,
      comment: comment,
      notifier: current_user
    ).notify_comment_created.deliver
  end
end

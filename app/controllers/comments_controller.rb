# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, only: [:create]

  def create
    comment = @post.comments.new(comment_params)

    if comment.save
      if @post.user.present?
        NotificationsMailer.with(
          user: @post.user,
          comment: comment,
          notifier: current_user
        ).notify_comment_created.deliver
      end
      flash[:notice] = 'Comment created!'
    else
      flash[:alert] = 'Error creating post!'
    end
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user&.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

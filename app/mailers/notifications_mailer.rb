# frozen_string_literal: true

class NotificationsMailer < ApplicationMailer
  def notify_comment_created
    @user = params[:user]
    @notifier = params[:notifier]
    @comment = params[:comment]
    mail(to: @user.email, subject: 'Someone commented on one of your posts')
  end

  def notify_resource_liked
    @resource = params[:resource]
    @notifier = params[:notifier]

    mail(to: @resource.user, subject: "Someone liked a #{@resource.class} of yours")
  end
end

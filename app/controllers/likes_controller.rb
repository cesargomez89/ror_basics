class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_back fallback_location: root_path
    else
      flash[:alert] = "Oye, ya le diste like"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @like = Like.find(params[:id]).destroy

    redirect_back fallback_location: root_path
  end

  private

  def like_params
    params.permit(:likable_type, :likable_id, :user_id)
  end
end

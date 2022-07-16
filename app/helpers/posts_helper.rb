module PostsHelper
  def user_liked?(resource)
    Like.where(user_id: current_user.id, likable: resource).any?
  end

  def find_user_like(resource)
    Like.find_by(user_id: current_user.id, likable: resource)
  end
end

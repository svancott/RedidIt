module UsersHelper
  def has_not_posted_or_commented(user)
    user.posts.empty? && user.comments.empty?
  end
end

# def user_is_authorized_for_post?(post)
#   current_user && (current_user == post.user || current_user.admin?)
# end

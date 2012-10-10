module CommentsHelper

	def comment_user(user_id)
      User.find_by_id(user_id).firstname rescue""
  #  user.firstname + " " + user.lastname rescue ""
	end
end

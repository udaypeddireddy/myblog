class CommentsController < ApplicationController

def create

@entry = Entry.find(params[:entry_id])
@category = Category.find(@entry.category_id)
@comment = @entry.comments.build(params[:comment])
@comment.user_id = session[:user_id]
@comment.save
redirect_to category_entry_path(@category,@entry)
end

def destroy

	@entry = Entry.find(params[:entry_id])
	@category = Category.find(@entry.category_id)
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect_to category_entry_path(@category,@entry), :notice=> "Comment deleted"
end
end


class HomeController < ApplicationController

 def index
  @users_awaiting_approval = User.awaiting_approval.all
  @posts_recent = Category.recent
 end	
end

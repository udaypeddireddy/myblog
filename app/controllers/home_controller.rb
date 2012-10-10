class HomeController < ApplicationController

 def index
  @users_awaiting_approval = User.awaiting_approval.all
 end	
end

class SessionsController < ApplicationController

skip_before_filter :require_login 
def create
 user = User.authenticate(params[:email], params[:password])
if user 
session[:user_id] = user.id
redirect_to categories_path, :notice => "Logged in!"
else
   redirect_to root_path, :notice=>"Invalid Email or Password"
end
end
def destroy
session.clear
  redirect_to root_path, :notice => "Logged Out!"
end

end


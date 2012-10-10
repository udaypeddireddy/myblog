class UsersController < ApplicationController

skip_before_filter :require_login 
def index
  @users = User.all
 end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /logins/new
  # GET /logins/new.json
  def new
    @user = User.new
  end

  # GET /logins/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /logins
  # POST /logins.json
  def create
    @user = User.new(params[:user])
    if @user.save
    @org = OrganizationProfile.new
    @org.user_id = @user.id
    @org.save
    UserMailer.registration(@user).deliver
    redirect_to root_path, notice: 'Registered Successfully Please Check Your Inbox For Password' 
    else
    render action: "new"
    end
  end

  # PUT /logins/1
  # PUT /logins/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logins/1
  # DELETE /logins/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    end
  end


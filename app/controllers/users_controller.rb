 class UsersController < ApplicationController
  #load_and_authorize_resource  #accomplishes the routing to match the user against the role and access
  before_action :authenticate_user!, only: :index


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if set_user == current_user
        @user = current_user
    elsif can? :manage, User
        set_user
    else
        redirect_to user_path(current_user), :flash => { :notice => "You can only see your own account" } #or that of your partners one day.
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
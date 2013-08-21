class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def edit
    if set_user == current_user
        @user = current_user
    elsif can? :manage, User
        set_user
    else
        redirect_to edit_user_registration_path(current_user), :flash => { :notice => "You can only edit your own account" }
    end
  end

  def update
    super
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:format])
    end
end 
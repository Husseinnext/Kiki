class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to user_path(current_user)
    else
      render template: "users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :country, :age, :gender, :email, :password, :avatar)

end

end

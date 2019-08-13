class UsersController < ApplicationController

  def new
   @user = User.new
 end

   def create
       @user = User.new(user_params)
       if @user.save
         flash[:success] = "Welcome to MugManual!"
         redirect_to "/" #needs changing to homepage
       else
         render 'new'
       end
   end

private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
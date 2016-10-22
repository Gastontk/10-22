class UsersController < ApplicationController
	# Remember to add before_filter :authorize to any controllers that 
	# should be blocked without proper login
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = "User #{@user.first_name} #{@user.last_name} created."
      redirect_to '/dashboard'
      # render plain: ' In saved'

    else

      render 'users/new'
    end
  end


  # holding page to be replaced by real page eventually.
  def holding_page

  end
  # for all unfoundpages that require 404
  def not_found
  end
  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end

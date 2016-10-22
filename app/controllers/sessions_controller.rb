class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id

      redirect_to '/dashboard'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:alert] ='Login failed. Check your Email and Password.'
      redirect_to '/signup'
    end
  end

  def destroy
  	flash[:nav] =' You have been successfully logged out.'
    session[:user_id] = nil
    redirect_to '/signup'
  end
end

class SessionsController < ApplicationController
# review and edit, copied from login
  
  def new
  end


  def create
  	reg = Reg.find_by_email(params[:email])
    # if the user exists AND the password entered is correct
    if reg && reg.authenticate(params[:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:reg_id] = reg.id
      redirect_to '/'
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def destroy
  	session[:reg_id] = nil
    redirect_to '/login'
  end
end

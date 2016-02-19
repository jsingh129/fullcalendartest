class RegController < ApplicationController
  def new
  end

  def create
  	reg = Reg.new(reg_params)
    if reg.save
      session[:reg_id] = reg.id
      redirect_to '/', notice: 'Account created successfully'
    else
      flash[:error] = 'An error occured!'
      # render 'new'
      redirect_to '/reg'
    end
  end

  private

  def reg_params
    params.require(:reg).permit(:name, :email, :password, :password_confirmation)
  end
end

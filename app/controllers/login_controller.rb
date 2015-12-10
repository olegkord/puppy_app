class LoginController < ApplicationController


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render 'success'
    else
      render 'login'
    end
  end


end

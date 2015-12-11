require 'securerandom'

class LoginController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      set_auth_token(user)
      user.update
      render 'success' #render the user JSON!
    else
      render 'login'
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:auth_token])
    nil_auth_token(user)
    render 'login'
  end


  private
    def set_auth_token(user)
      return if user[:auth_token].present?
      user.auth_token = generated_auth_token
    end

    def nil_auth_token(user)
      return if !user[:auth_token].present?
      user.auth_token = nil
    end

    def generated_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end

end

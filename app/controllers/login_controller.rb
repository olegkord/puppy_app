class LoginController < ApplicationController


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      set_auth_token(user)
      render 'success'
    else
      render 'login'
    end
  end

  private
    def set_auth_token(user)
      return if auth_token.present?
      user.auth_token = generated_auth_token
    end

    def generated_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end

end

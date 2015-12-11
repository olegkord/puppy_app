class UsersController < ApplicationController
  before_action :authenticate, except: [:create, :new]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def new
    render 'new'
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user
    else
      render json: {error: "User failed to save"}
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: {error: "User failed to update"}
    end
  end

  def delete
    user = User.find(params[:id])
    user.destroy
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

end

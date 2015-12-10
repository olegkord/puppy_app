class PostsController < ApplicationController
  before_action :authenticate

  def index
    render json: Post.all
  end

  def show
    render json: Post.find(params[:id])
  end


  def post_params


  end

end

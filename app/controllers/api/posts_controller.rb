class Api::PostsController < ApplicationController
  def index
    render json: Posts.all
  end
end

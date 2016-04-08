class Api::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    render json: get_post
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    post = Post.create!(post_params)
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request, need all paramaters", status: 400 }, status: 400
  end

  def update
    post = get_post
    post.update(post_params)
    post.save!
    render json: post
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Bad request, need all paramaters", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def destroy
    post = get_post
    post.delete
    render json: post
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  private
    def get_post
      Post.find(params.fetch(:id))
    end

    def post_params
      params.permit(:title, :body, :user_id)
    end
end

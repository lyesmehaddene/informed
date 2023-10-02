class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post_id, only: %i[show show_comments]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.url = "http://" + @post.url if @post.url.starts_with?("http://", "https://") == false
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: 'Votre publication a été créée avec succès !'
    else
      render :new
    end
  end

  private

  def set_post_id
    @post = Post.find_by(id: params["id"])
  end

  def post_params
    params.require(:post).permit(:title, :content, :url)
  end
end

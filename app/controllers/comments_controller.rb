class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = Post.find_by(id: params["post_id"])
    @comment = Comment.new
    @comment.content = params["comment"]["content"]
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post), notice: 'Votre commentaire a été ajouté avec succès !'
    else
      render 'posts/show'
    end
  end
end

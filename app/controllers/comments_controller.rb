class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      flash[:success] = 'Comment successfully created!'
    else
      flash[:error] = 'Comment creation failed!'
    end
    redirect_to user_post_path(current_user, post)
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
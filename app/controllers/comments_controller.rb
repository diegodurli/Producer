class CommentsController < ApplicationController

  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    
    flash[:alert] = 'Fail to receive the comment. Double check the fields' unless @comment.save
    respond_with @comment, location: post_path(@post)
  end

end

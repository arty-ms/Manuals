class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @commenter = User.find(current_user.id) 
     
    @comment = @post.comments.create!(
    	commenter: @commenter.email,
    	body: params[:comment][:body]
    	)
    redirect_to post_path(@post)
  end
end

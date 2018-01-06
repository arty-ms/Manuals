class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Your article was successfully saved"
		else
			render 'new', notice: "Oh, No"	
		end
	end

	def show
  	
  	end

  	def edit
  	end

  # Update action updates the post with the new information
  def update
    if @post.update(post_params)
      redirect_to @post, notice:"Successfully updated post!"
      
    else
      
      render :edit
    end
  end

  def destroy
  	@post = Post.find(params[:id])	
    @post.destroy
      
    redirect_to posts_path
  end

	private
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
    	@post = Post.find(params[:id])
  	end
end
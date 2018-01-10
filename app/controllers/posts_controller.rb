class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

  

	def index
    respond_to do |format|

    if params[:term]
      @posts = Post.search_by_full_post(params[:term]).with_pg_search_highlight
    else
      @posts = Post.all
	  end
    format.json
    format.html
    end
  end

	def new
		@post = Post.new
    @user = current_user
	end
	def upload
 		 uploaded_pics = params[:file] 
  		time_footprint = Time.now.to_i.to_formatted_s(:number) 

  		uploaded_pics.each do |pic|
    
   			 File.open(Rails.root.join('public', 'uploads', pic[1].original_filename), 'wb') do |file|
      		file.write(pic[1].read)
      		File.rename(file, 'public/uploads/' + time_footprint + pic[1].original_filename)
    	end
  end
  files_list = Dir['public/uploads/*'].to_json #get a list of all files in the {public/uploads} directory and make a JSON to pass to the server
  render json: { message: 'You have successfully uploded your images.', files_list: files_list } #return a JSON object amd success message if uploading is successful
end
	def create
		@post = current_user.posts.build(post_params)
		
		if @post.save 
			redirect_to @post, notice: "Your article was successfully saved"
		else
			render 'new', notice: "Oh, No"	
		end
	end

	def show
  	@comments = Comment.where(post_id: @post.id).reverse_order
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
      
    redirect_to root_path
  end

	private
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
    	@post = Post.find(params[:id])
  	end

  	def authorize
		unless current_user
			redirect_to root_url, notice: "Пожалуйста, пройдите авторизацию"
		end
	end
end

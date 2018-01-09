class StartPageController < ApplicationController
  def index
  	@posts = Post.all
  	@users = User.all
  	if current_user	
  	@user = User.find(current_user.id)
   	end

  end
  def show
    if current_user 
    @user = User.find(current_user.id)
  	end
    @user_posts = Post.where(user_id: current_user.id).all
  end
end

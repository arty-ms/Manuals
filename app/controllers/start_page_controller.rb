class StartPageController < ApplicationController
  def index
  	@posts = Post.all
  	@users = User.all	
  	@user = User.find(current_user.id)

  end
  def show
  	@user = User.find(current_user.id)
    @user_posts = Post.where(user_id: current_user.id).all
  end
end

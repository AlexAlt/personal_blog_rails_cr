class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
     1.times { @post.tags.build}
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "You did it!! Post posted!"
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(current_user, @post)
      flash[:notice] = "Success!"
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
     params.require(:post).permit(:title, :image, :content, tags_attributes: [:id, :name])
  end

end
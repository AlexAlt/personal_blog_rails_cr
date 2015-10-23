class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
     2.times { @post.tags.build}
  end

  def create
    @post = Post.new(post_params)
    authorize! :create, @post
    if @post.save
      flash[:notice] = "You did it!! Post posted!"
      redirect_to posts_path
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
      redirect_to post_path(@post)
      flash[:notice] = "Success!"
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
     params.require(:post).permit(:user_name, :title, :image, :content, tags_attributes: [:id, :name])
  end

end
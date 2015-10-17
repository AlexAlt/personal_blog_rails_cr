class TagsController < ApplicationController
  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new
  end
end
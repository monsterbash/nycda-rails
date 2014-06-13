class PostsController < ApplicationController
  def index
    if params[:user_id].present?
      @posts = User.find(params[:user_id]).posts
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(user_params)
      flash[:notice] = "Post updated!"
      redirect_to post_path(@post)
    else
      flash[:notice] = "Failed to update post"
      redirect_to edit_post_path(@post)
    end

  end

  def create
    @post = current_user.posts.create( post_params )

    if @post 
      flash[:alert] = "Posted successfully!"
      redirect_to post_path(@post) 
    else
      flash[:alert] = "Oops! Something went wrong!"
      redirect_to new_post_path
    end
  end

  def destroy
      @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted successfully."
    else
      flash[:alert] = "There was a problem."
    end
    redirect_to new_post_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).
      permit(:post_text)
  end

end

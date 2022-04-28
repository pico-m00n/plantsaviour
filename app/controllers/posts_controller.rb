class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
   #タグ絞り込み機能
    @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
  end

  def show
  end

  def new
    @tags = Tag.all
    @post = Post.new
  end

  def edit
    @tags = Tag.all
  end

  # create のみ修正
  def create
    @post = current_end_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: 'Post was successfully created.'}
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notice: 'Post was successfully updated.'}
        format.json {render :show, status: :ok, location: @post}
      else
        format.html {render :edit}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_url, notice: 'Post was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

 #Tag??
  def post_params
    params.require(:post).permit(:end_user_id, :title, :body, {:tag_ids => []})
  end

end

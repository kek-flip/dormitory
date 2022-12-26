class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :check_access, only: %i[ new create edit update ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.fetch(:post, {}).merge({council_member_id: @_current_user_role.id}).permit(:title, :text, :council_member_id)
    end

    def check_access
      redirect_to posts_path, alert: 'Нет доступа' if @_user_access != ApplicationController::COUNCIL_MEMBER
    end
end

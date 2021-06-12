class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index ]
  
  def show
  end
  
  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:comments).order(created_at: :desc).paginate(page: params[:page], per_page: 4)
  end
  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_back fallback_location: posts_url }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        flash[:alert] = @post.errors.full_messages.to_sentence
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_back fallback_location: posts_url, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_back fallback_location: posts_url }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        flash[:alert] = @post.errors.full_messages.to_sentence
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
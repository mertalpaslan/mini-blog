class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def edit
  end
  # POST /comments or /comments.json
  def create
    @comment = current_user.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js 
      else
        format.html { redirect_back fallback_location: posts_url, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        flash[:alert] = @comment.errors.full_messages.to_sentence
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js 
      else
        format.html { redirect_back fallback_location: posts_url, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        flash[:alert] = @comment.errors.full_messages.to_sentence
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def other_comments
    format.js
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :post_id)
    end
end
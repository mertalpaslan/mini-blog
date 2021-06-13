class BlogsController < ApplicationController
    before_action :set_blog
    before_action :authenticate_user! , except: %i[ show ]

    def show
      @posts = @blog.user.posts.includes(:comments).order(created_at: :desc).paginate(page: params[:page], per_page: 4)
      @user = @blog.user
    end
  
    def update
        respond_to do |format|
          if @blog.update(blog_params)
            format.html { redirect_to blog_url(@blog), notice: "Blog was successfully updated." }
            format.json { render :show, status: :ok, location: @blog }
          else
            format.html { redirect_back fallback_location: posts_url }
            format.json { render json: @blog.errors, status: :unprocessable_entity }
            flash[:alert] = @blog.errors.full_messages.to_sentence
          end
        end
      end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @blog = Blog.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def blog_params
        params.require(:blog).permit(:name, :background_color, :header_color, :text_color, :title_color, :font_family)
      end
  end
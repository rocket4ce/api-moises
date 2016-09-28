class Api::V1::PostsController < Api::V1::ApplicationController
    before_action :set_post, only:[ :destroy, :update ]
    before_action :autenticame
    before_action :authenticate_user!
    # POST /posts.json
    def index
      render json: Post.all
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end

    end

    # PATCH/PUT /posts/1
    # PATCH/PUT /posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.json { render :show, status: :ok, location: @post }
        else
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /posts/1
    # DELETE /posts/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:titulo)
      end
end

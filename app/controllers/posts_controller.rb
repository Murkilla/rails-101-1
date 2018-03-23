class PostsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    def new
        @groups = Group.find(params[:group_id])
        @post = Post.new
    end
    def create
        @groups = Group.find(params[:group_id])
        @post = Post.new(post_params)
        @post.group = @groups
        @post.user = current_user
        if @post.save
            redirect_to group_path(@groups)
        else
            render :new
        end
    end
    def edit
        @groups = Group.find(params[:group_id])
        @posts = Post.find(params[:id])
    end
    def update
        @groups = Group.find(params[:group_id])
        @posts = Post.find(params[:id])
        if @posts.update(post_params)
            redirect_to account_posts_path, notice: "Updte Success!!!!"
        else
            render :edit
        end
    end
    def destroy
        @groups = Group.find(params[:group_id])
        @posts = Post.find(params[:id])
        @posts.destroy
        flash[:alert] = "Post deleted"
        redirect_to account_posts_path
    end
    private
    def post_params
        params.require(:post).permit(:content)
    end
end

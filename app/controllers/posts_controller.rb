class PostsController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create]
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
    private
    def post_params
        params.require(:post).permit(:content)
    end
end

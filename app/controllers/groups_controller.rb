class GroupsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
    before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]
    def index
        @groups = Group.all
    end
    def new
        @groups = Group.new
    end
    def show
        @groups = Group.find(params[:id])
        @posts = @groups.posts.order("created_at DESC")
    end
    def edit
        @groups = Group.find(params[:id])
    end
    def update
        @groups = Group.find(params[:id])
        if @groups.update(group_params)
            redirect_to groups_path, notice: "Updte Success!!!!"
        else
            render :edit
        end
    end
    def destroy
        @groups = Group.find(params[:id])
        @groups.destroy
        flash[:alert] = "Group deleted"
        redirect_to groups_path
    end
    def create
        @groups = Group.new(group_params)
        @groups.user = current_user
        if @groups.save
            redirect_to groups_path
        else
            render :new
        end
    end

    private

    def group_params
        params.require(:group).permit(:title, :description)
    end
    def find_group_and_check_permission
        @groups = Group.find(params[:id])
        if current_user != @groups.user
            redirect_to root_path, alert: "You have no permission!!"
        end
    end
end

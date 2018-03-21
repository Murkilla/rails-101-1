class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    def new
        @groups = Group.new
    end
    def show
        @groups = Group.find(params[:id])
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
end

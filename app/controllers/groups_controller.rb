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
        @groups.update(group_params)
        redirect_to groups_path, notice: "Updte Success!!!!"
    end
    def create
        @group = Group.new(group_params)
        @group.save
        redirect_to groups_path
    end

    private

    def group_params
        params.require(:group).permit(:title, :description)
    end
end

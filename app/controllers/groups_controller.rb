class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(set_params)
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update(set_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
    def set_params
      params.require(:group).permit(:name)
    end
end
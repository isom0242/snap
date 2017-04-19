class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :destroy, :update]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(set_params)
#    redirect_to groups_path
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  def edit
  end

  def update
    if @group.update(set_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end
    def set_params
      params.require(:group).permit(:name)
    end
end

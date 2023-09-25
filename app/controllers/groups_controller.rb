class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @groups = current_user.groups.includes(:payments)
  end

  def show
    @group = Group.includes(:payments).find(params[:id])
  end

  def new
  end

  def create
    @group = current_user.groups.build(group_params)
    

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      flash.now[:alert] = 'Group could not be created.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private

def group_params
  params.require(:group).permit(:name, :icon)
end

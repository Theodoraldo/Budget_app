class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Category created successfully.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end

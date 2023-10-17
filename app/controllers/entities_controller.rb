class EntitiesController < ApplicationController
  def new
    @groups = Group.all
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.new(trans_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to groups_path, notice: 'Transaction created successfully.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @entity = current_user.entities.where(group_id: params[:id])
  end

  private

  def trans_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end

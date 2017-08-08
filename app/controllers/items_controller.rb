class ItemsController < ApplicationController
  def new
    @new_item = Item.new
  end

  def create
    @new_item = Item.create(item_params)
    if @new_item.valid?
      Rails.logger.info { 'New item created' }
    else
      flash[:notice] = 'Error creating item'
      render :new
    end
  end

  private

  def item_params
    permitted.merge(user_info)
  end

  def user_info
    { user_id: current_user.id }
  end

  def permitted
    params.require(:item).permit(:text)
  end
end

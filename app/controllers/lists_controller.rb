class ListsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @user_lists = List.where(user_id: @user.id)
  end

  def new
    @new_list = List.new
  end

  def create
    @new_list = List.create(list_pararms)
    if @new_list.valid?
      Rails.logger.info {"New List #{list_pararms[:title]} created."}
    else
      flash[:notice] = "Error: #{@new_list.errors.messages}"
      render :new
    end
  end

  def delete
  end

  private

  def list_pararms
    permitted.merge(user_info)
  end

  def user_info
    {user_id: current_user.id }
  end

  def permittted
    params.require(:list).permit(:title)
  end
end

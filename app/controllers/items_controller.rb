class ItemsController < ApplicationController
  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user


    if @item.save
      flash[:notice] = "To-do item was saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the to-do item. Please try again."
      redirect_to user_path(current_user)
    end
  end
end
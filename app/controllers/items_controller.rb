class ItemsController < ApplicationController
  def create
    @item = Item.new
    @item.name = [:item][:name]
    @item.user = current_user


    if @item.save
      flash[:notice] = "To-do item was saved."
      redirect_to @item
    else
      flash.now[:alert] = "There was an error saving the to-do item. Please try again."
      render :show 
    end
  end
end

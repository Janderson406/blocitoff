class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "To-do item was saved."
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "There was an error saving the to-do item. Please try again."
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash.now[:notice] = "\"#{@item.name}\" is now complete!"
    else
      flash.now[:alert] = "There was an error removing the to-do item."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end

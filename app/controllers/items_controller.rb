class ItemsController < ApplicationController

  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      flash.now[:notice] = "Item has been successfully added to your list"
    else
      flash.now[:alert] = "There was an error saving your list item. Please try again"
    end
     redirect_to root_path
  end

  def destroy
    @item = current_user.items.find(params[:id])
    
    if @item.destroy
      flash.now[:notice] = "Way to go! Your completed item has been removed from your list."
    else
      flash.now[:alert] = "There was an error deleting your completed task. Please try again."
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end

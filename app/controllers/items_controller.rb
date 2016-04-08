class ItemsController < ApplicationController

  
  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      flash[:notice] = "Item has been successfully added to your list"
    else
      flash[:alert] = "There was an error saving your list item. Please try again"
    end
     redirect_to root_path
  end

private

def item_params
  params.require(:item).permit(:name)
end
end

class ItemsController < ApplicationController

  
  def create
    @item = current_user.items.new(item_params)
    
    if @item.save
      flash[:notice] = "Item has been successfully added to your list"
      redirect_to root_path
    else
      flash[:alert] = "There was an error saving your list item. Please try again"
      render 'items/form'
    end
  end

private

def item_params
  params.require(:item).permit(:name)
end
end

class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new
    @name = params[:item][:name]
    
    if @item.save
      flash[:notice] = "Item has been successfully added to your list"
      redirect_to root_path
    else
      flash[:alert] = "There was an error saving your list item. Please try again"
      render :new
    end
  end
  
end

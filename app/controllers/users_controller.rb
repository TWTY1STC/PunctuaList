class UsersController < ApplicationController
  def show
    @item = Item.new
  end
  
  def destroy
    @item = current_user.items.find(params[:id])
  end
end

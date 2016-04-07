require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

 let(:new_user) {User.create!(username: "My_User", email: "good@email.com", password: "password")}
   let(:my_item) { Item.create!(name: "New to-do item", user: new_user) }
   
  describe "GET new" do
    it "returns http success" do
      get :new, user_id: new_user.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new, user_id: new_user.id, id: my_item.id
      expect(response).to render_template :new
    end
    
    it "instantiates @item" do
      get :new, user_id: new_user.id, id: my_item.id
      expect(assigns(:item)).not_to be_nil
    end
  end
   
  describe "POST #create" do
    it "increases the number of Item by 1" do
      expect{post :create, user_id: new_user.id, item: {name: "Complete taxes for past year"}}.to change(Item,:count).by(1)
    end
    
    it "assigns the new item to @item" do
      post :create, user_id: new_user.id, item: {name: "Complete taxes for past year"}
      expect(assigns(:item)).to eq Item.last
    end
    
    it "redirects to the new post" do
      post :create, user_id: new_user.id, item:{name: "Complete taxes for past year"}
      expect(response).to redirect_to root
    end
  end
end


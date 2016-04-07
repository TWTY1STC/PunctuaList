 require 'rails_helper'

 RSpec.describe Item, type: :model do
   let(:user) {User.create!(username: "My_User", email: "good@email.com", password: "password")}
   let(:item) { Item.create!(name: "New to-do item", user: user) }
 
   describe "attributes" do
     it "responds to name attribute" do
       expect(item).to have_attributes(name: "New to-do item")
     end
   end
 end
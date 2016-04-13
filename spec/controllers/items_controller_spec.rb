require 'rails_helper'
require 'faker'

RSpec.describe ItemsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:my_item) { create(:item, user: my_user) }


  before do
    my_user.confirm
    sign_in my_user
  end


  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{post :create, item: {name: Faker::Hacker.say_something_smart}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, item: {name: Faker::Hacker.say_something_smart}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the new item" do
      post :create, item: {name: Faker::Hacker.say_something_smart}
      expect(response).to redirect_to User.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
      count = Item.where({id: my_item.id}).size
      expect(count).to eq 0
    end
  end
end

=begin

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_item) { Item.create!(name: "New to-do task item") }

  describe "POST create" do
    it "increases the number of Item by 1" do
      expect{post :create, item: {name: "New to-do task item"}}.to change(Item,:count).by(1)
    end

    it "assigns the new item to @item" do
      post :create, item: {name: "New to-do task item"}
      expect(assigns(:item)).to eq Item.last
    end

    it "redirects to the new item" do
      post :create, item: {name: "New to-do task item"}
      expect(response).to redirect_to Item.last
    end
  end
end

=end

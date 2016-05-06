
require 'rails_helper'

feature 'run rake task delete_items' do
  before do
    create(:item, created_at: 8.days.ago)
  end

  scenario "delete items 7 days after they are created" do
    #run rake task syntax
    expect(Item.count).to eq(0)
  end
end

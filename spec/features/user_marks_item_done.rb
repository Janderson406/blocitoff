require 'rails_helper'

feature 'User marks item as complete' do
  let(:user) { create :user }
  let(:item) { create :item }

  scenario 'Successfully' do
    visit ('/users/sign_in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit ('/users/show')

    click_link('') #unable to identify js destroy link?
    expect(page).to have_content("is now complete!")
    expect(page).to_not have_content(item.name)
  end
end

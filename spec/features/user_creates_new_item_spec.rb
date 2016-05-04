require 'rails_helper'

feature 'User creates item' do
  let(:user) { create :user }

  scenario 'Successfully' do
    visit ('/users/sign_in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit ('/users/show')
    expect(page).to have_content('To-Do List')
    fill_in 'item_name', with: 'finish testing the app'
    click_button 'Submit'
    expect(page).to have_content('To-do item was saved')
    expect(page).to have_content('finish testing the app')
  end
end

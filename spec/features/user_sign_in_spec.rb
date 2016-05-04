require 'rails_helper'

feature 'Existing user signs in' do
  let(:user) { create :user }

  scenario 'Successfully' do
    visit ('/users/sign_in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
  end
end

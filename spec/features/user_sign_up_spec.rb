require 'rails_helper'

feature 'New user signs up' do

  scenario 'Successfully' do
    visit ('/users/sign_up')
    fill_in 'Email', with: 'user@bloc.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
  end
end

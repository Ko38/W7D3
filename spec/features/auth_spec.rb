require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do 
    visit new_user_url
    expect(page).to have_content 'Users#new'
  end


  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in 'user[user_name]', with: 'asem'
      fill_in 'user[password]', with: '123456'
      click_on 'Sign up'
      expect(page).to have_content 'asem'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'user[user_name]', with: 'asem'
    fill_in 'user[password]', with: '123456'
    click_on 'Log in'
    expect(page).to have_content 'asem'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit users_url 
    click_on 'Log out'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(page).to have_no_content 'asem'
  end

end
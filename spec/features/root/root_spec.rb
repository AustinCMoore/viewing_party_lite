require 'rails_helper'

RSpec.describe 'The landing page' do
  before :each do 
    UserParty.destroy_all
    User.destroy_all
    Party.destroy_all
    visit register_path
    fill_in 'Name', with: 'Plain Name'
    fill_in 'Email', with: 'User@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user_1 = User.last

    visit register_path
    fill_in 'Name', with: 'Ron Swanson'
    fill_in 'Email', with: 'Ron@gmail.com'
    fill_in 'Password', with: '1234'
    fill_in 'Password confirmation', with: '1234'

    click_button('Register')
    @user_2 = User.last
  end 
  it 'displays the title of application' do
    visit root_path

    within '#title' do
      expect(page).to have_content('Welcome to Viewing Party')
    end

    within '#new-user' do
      expect(page).to have_button 'Register' 
      click_button 'Register'
      expect(current_path).to eq('/register')
    end

    visit root_path
    within '#users' do
      expect(page).to have_content(@user_2.email)
    end
  end
end
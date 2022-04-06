require 'rails_helper'

RSpec.describe 'The landing page' do
  it 'displays the title of application' do
    user = User.create!(name: 'user_1', email: 'email@gmail.com', password: 'pass123')

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
      expect(page).to have_link(user.name)
      click_link(user.name)
      expect(current_path).to eq(user_path(user.id))
    end
  end
end
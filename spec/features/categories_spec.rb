require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  before :each do
    @user1 = User.create!(username: 'gurbuz')
  end

  scenario 'User1  logs in and checks out articles on root path' do
    visit login_path
    fill_in 'username', with: 'gurbuz'
    click_button 'submit'
    expect(page).to have_content('FEATURED ARTICLE')    
    click_link 'Logout'
  end

end
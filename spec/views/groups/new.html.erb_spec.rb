require 'rails_helper'

RSpec.describe 'groups/new.html.erb', type: :view do
  before(:each) do
    @user = User.create!(name: 'testuser', email: 'test@testmail.com', password: 'testpassword',
                         password_confirmation: 'testpassword')
    @group = @user.groups.create!(name: 'testgroup',
                                  icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Video-Game-Controller-Icon-IDV-green.svg/2048px-Video-Game-Controller-Icon-IDV-green.svg.png', user_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'test@testmail.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'
    click_link('Add New Category')
  end
  it 'Validates HTML Elements' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
  end
  it 'Renders Save Button' do
    expect(page).to have_button 'Save'
  end
end

require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :view do
  before(:each) do
    @user = User.create!(name: 'testuser', email: 'test@testmail.com', password: 'testpassword',
                         password_confirmation: 'testpassword')
    @group = @user.groups.create!(name: 'testgroup',
                                  icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Video-Game-Controller-Icon-IDV-green.svg/2048px-Video-Game-Controller-Icon-IDV-green.svg.png', user_id: @user.id)
    visit user_session_path
    fill_in 'Email', with: 'test@testmail.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'
  end

  it 'Validates Correct Group Path' do
    expect(page).to have_current_path root_path
  end

  it 'Validates Correct Header Content' do
    expect(page).to have_content 'Home'
  end

  it 'Validates Add New Category Button' do
    expect(page).to have_link 'Add New Category'
  end

  it 'Redirects Specific Group If Group Name Clicked' do
    click_link 'testgroup'
    expect(page).to have_current_path group_expenses_path(@group.id)
  end

  it 'Redirects New Group If Add New Category Clicked' do
    click_link('Add New Category')
    expect(page).to have_current_path new_group_path
  end
end

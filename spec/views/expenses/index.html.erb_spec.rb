require 'rails_helper'

RSpec.describe 'expenses/index.html.erb', type: :view do
  before(:each) do
    @user = User.create!(name: 'testuser', email: 'test@testmail.com', password: 'testpassword', password_confirmation: 'testpassword')
    @group = @user.groups.create!(name: 'testgroup', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Video-Game-Controller-Icon-IDV-green.svg/2048px-Video-Game-Controller-Icon-IDV-green.svg.png', user_id: @user.id)
    @expense = Expense.create(name: 'textexpense', amount: 1000.0, user_id: @user.id, group_id: @group.id)
    visit new_user_session_path
    fill_in 'Email', with: 'test@testmail.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'
    visit group_expenses_path(@group.id)
  end

  it 'display expenses on page' do
    expect(page).to have_content('Total Spent:')
  end

  it 'display Add new transaction button on page' do
    expect(page).to have_link 'Add New Expense'
  end
end

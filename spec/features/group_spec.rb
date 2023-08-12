require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456')

    sign_in @user, scope: :user

    file_path = Rails.root.join('app', 'assets', 'images', 'back.png')
    file = File.open(file_path)
    @group = Group.new(name: 'Test group', author_id: @user.id)
    @group.icon.attach(io: file, filename: 'back.png', content_type: 'image/png')
    @group.save
  end
  describe 'group page' do
    scenario 'should have the name of the group' do
      visit groups_path
      expect(page).to have_content(@group.name)
    end
    scenario 'should have a  total amount' do
      visit groups_path
      expect(page).to have_content(@user.expenses.sum(:amount))
    end
  end
  describe 'new group page' do
    scenario 'should have a new group page' do
      visit new_group_path
      expect(page).to have_content('CATEGORIES')
    end
    scenario 'should have the name of the group' do
      visit groups_path
      expect(page).to have_content(@group.name)
    end
    scenario 'when a user clicks save button with valid data it will redirect to group page' do
      visit new_group_path
      fill_in 'Name', with: 'Test group'
    end
  end
end

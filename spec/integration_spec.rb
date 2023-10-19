require 'rails_helper'

RSpec.describe 'Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    user = User.create(name: 'Theodoraldo', email: 'theodore@gmail.com', password: 'password123')

    sign_in user
    visit groups_path
  end

  it 'see the title of the application ' do
    expect(page).to have_content('Budget App')
  end

  it 'Used who has logged in' do
    expect(page).to have_content('Welcome Theodoraldo')
  end

  it 'Find nav links' do
    expect(page).to have_content('Category')
    expect(page).to have_content('New Transactions')
    expect(page).to have_content('Most recent')
    expect(page).to have_content('Most ancient')
  end

  it 'see the category page' do
    expect(page).to have_content('Category List')
  end

  it 'Display button add category' do
    expect(page).to have_link('New Category')
  end

  it 'When I click on add category, should be redirected to category\'s new page' do
    click_link 'New Category', href: new_group_path
    expect(page).to have_current_path(new_group_path)
  end
end

RSpec.describe 'Add Category Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    user = User.create(name: 'Theodoraldo', email: 'theodore@gmail.com', password: 'password123')

    sign_in user
    visit new_group_path
  end

  it 'see the title of the application ' do
    expect(page).to have_content('Budget App')
  end

  it 'See add category' do
    expect(page).to have_content('Add Category')
  end

  it 'Display button add category' do
    expect(page).to have_button('Save Category')
  end

  it 'fill category form and submit it' do
    fill_in 'Name', with: 'Melcom'
    fill_in 'Icon url', with: 'q=tbn:ANd9GcQgGv4xkuVEornxwKLRdZGkC2XeGGOM2hDRlBqTl6B0jA&s'

    click_button 'Save Category'

    expect(page).to have_current_path(groups_path)
    expect(page).to have_content('Category created successfully')
    expect(page).to have_content('Melcom')
    expect(page).to have_content('$0.00')
  end

  it 'Display back button' do
    expect(page).to have_link('<')
  end

  it 'When I click on add category, should be redirected to category\'s new page' do
    click_link '<', href: groups_path
    expect(page).to have_current_path(groups_path)
  end
end

RSpec.describe 'Entities index and show Pages', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    user = User.create(name: 'Theodoraldo', email: 'theodore@gmail.com', password: 'password123')
    Group.create(name: 'Melcom', icon: 'q=tbn:ANd9GcQgGv4xkuVEornxwKLRdZGkC2XeGGOM2hDRlBqTl6B0jA&s',
                 user_id: user)

    sign_in user
    visit new_entity_path
  end

  it 'see the title of the application ' do
    expect(page).to have_content('Budget App')
  end

  it 'See add category' do
    expect(page).to have_content('Add Transaction')
  end

  it 'See add category' do
    expect(page).to have_content('Select transaction category')
  end

  it 'Display back button' do
    expect(page).to have_link('<')
  end

  it 'When I click on add category, should be redirected to category\'s new page' do
    click_link '<', href: groups_path
    expect(page).to have_current_path(groups_path)
  end

  it 'Display logout button' do
    expect(page).to have_link('Sign Out')
  end

  it 'logout' do
    click_link 'Sign Out', href: destroy_user_session_path
    expect(page).to have_current_path(user_session_path)
  end
end

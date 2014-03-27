require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "users can create an item" do
    visit '/'

    click_link "New Item"
    fill_in "new_item", with: "Pizza"
    click_on "Create Item"

    expect(page).to have_content "Pizza"
  end
end
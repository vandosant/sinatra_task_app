require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "when managing items" do
  scenario "user can create a new task" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy milk"
    click_on "Create Task"

    expect(page).to have_content("buy milk")
  end
end
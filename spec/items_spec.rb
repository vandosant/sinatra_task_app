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

  scenario "user can view task details" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy cheese"
    click_on "Create Task"

    click_on "show_1"

    expect(page).to have_content("buy cheese")
  end
end
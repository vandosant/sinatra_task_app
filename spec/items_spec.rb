require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "user is able to create a new task" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy milk"
    click_on "Create Task"

    expect(page).to have_content("buy milk")
  end

  scenario "user is able to view task details" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy cheese"
    click_on "Create Task"

    click_on "show_1"

    expect(page).to have_content("buy cheese")
  end
end
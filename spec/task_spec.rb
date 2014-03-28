require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "task management" do
  scenario "user able to create a task" do
    visit '/'

    fill_in "new_task", with: "get milk"
    click_on "Create Task"

    expect(page).to have_content("get milk")
  end
end
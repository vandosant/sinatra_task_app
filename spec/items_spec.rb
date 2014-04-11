require 'spec_helper'
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

    click_on "show buy cheese"

    expect(page).to have_content("buy cheese")
  end

  scenario "user is able to complete a task" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy bread"
    click_on "Create Task"

    click_on "complete buy bread"

    expect(page).to_not have_content("buy bread")
  end

  scenario "user is able to rename a task" do
    visit '/'

    click_link("Add a Task")
    fill_in "new_task", with: "buy eggs"
    click_on "Create Task"

    click_on "show buy eggs"
    fill_in "renamed_task", with: "buy pasta"
    click_on "Rename Task"

    expect(page).to_not have_content("buy eggs")
    expect(page).to have_content("buy pasta")
  end
end
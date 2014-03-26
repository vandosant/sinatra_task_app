require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "managing items" do
  scenario "user can visit the homepage" do
    visit '/'

    expect(page).to have_content("welcome")
  end
end
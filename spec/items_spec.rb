require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature "item management" do
  scenario "users can visit homepage" do
    visit '/'

    expect(page).to have_content "welcome"
  end
end
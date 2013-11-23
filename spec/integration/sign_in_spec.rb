require 'spec_helper'

feature "Sign up as a user" do 
  scenario "with an email address" do 
    visit root_path
    find(:css, "#new_user input[id='user_email']").set "person@example.com"
    find(:css, "#new_user input[id='user_password']").set "password"
    click_button "Sign up"
    expect(page).to have_css '.alert', text: "Welcome! You have signed up successfully"
  end
end

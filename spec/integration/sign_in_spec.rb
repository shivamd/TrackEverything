require 'spec_helper'

feature "Sign up as a user" do 
  scenario "with an email address" do 
    sign_up
    expect(page).to have_css '.alert', text: "Welcome! You have signed up successfully"
  end
end

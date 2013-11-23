require 'spec_helper'

feature "manage topics" do
  scenario "create new topic" do
    visit root_path
    find(:css, "#new_user input[id='user_email']").set "person@example.com"
    find(:css, "#new_user input[id='user_password']").set "password"
    click_button "Sign up"
    click_link "Add Topic"
    fill_in "Name", with: "My Topic"
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: "Why am I here?"
    click_button "Create topic"

    expect(page).to have_css "h2", text: "My Topic"
    expect(page).to have_css "li", text: "Why am I here?"
  end
end

require 'spec_helper'

feature "manage topics" do
  scenario "create new topic" do
    sign_up
    click_link "Add Topic"
    fill_in "Name", with: "My Topic"
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: "Why am I here?"
    click_button "Create topic"

    expect(page).to have_css "h2", text: "My Topic"
    expect(page).to have_css "li", text: "Why am I here?"
  end

  scenario "view only my topics" do 
    Topic.create(name: "hello")
    sign_up
    click_link "Add Topic"
    fill_in "Name", with: "My Topic"
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: "Why am I here?"
    click_button "Create topic"

    expect(page).to have_css "h2", text: "My Topic"
    expect(page).to_not have_css "h2", text: "hello"
  end
end

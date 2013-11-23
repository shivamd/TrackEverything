require 'spec_helper'

feature "manage topics" do
  scenario "create new topic" do
    sign_up
    create_topic

    expect(page).to have_css "h2", text: "My Topic"
    expect(page).to have_css "li", text: "Why am I here?"
  end

  scenario "view only my topics" do 
    Topic.create(name: "hello")
    sign_up
    create_topic

    expect(page).to have_css "h2", text: "My Topic"
    expect(page).to_not have_css "h2", text: "hello"
  end
end

require 'spec_helper'

feature "manage topics" do
  scenario "create new topic" do
    sign_up
    create_topic_with_name "My Topic"

    user_sees_topic_item "My Topic"
  end

  scenario "view only my topics" do 
    create(:topic, name: "hello")
    sign_up
    create_topic_with_name "My Topic"

    user_sees_topic_item "My Topic"
    user_does_not_see_topic_item "hello"
  end

  def user_sees_topic_item(description)
    expect(page).to have_css "h2", text: description
  end
  
  def user_does_not_see_topic_item(description)
    expect(page).to_not have_css "h2", text: description
  end
end

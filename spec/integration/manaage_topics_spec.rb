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

  scenario "questions should belong to topic", js: true do
    sign_up
    create_topic_with_questions "how are you?", "What did you get done today?"
    user_sees_question_item "how are you?"
    user_sees_question_item "how are you?"
  end

  def user_sees_topic_item(description)
    expect(page).to have_css "h2", text: description
  end

  def user_does_not_see_topic_item(description)
    expect(page).to_not have_css "h2", text: description
  end

  def user_sees_question_item(question)
    expect(page).to have_css "li", text: question
  end
end

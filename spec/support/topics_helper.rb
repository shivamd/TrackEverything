module TopicsHelper
  def create_topic_with_name name
    click_link "Add Topic"
    fill_in "Name", with: name
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: "Why am I here?"
    click_button "Create topic"
  end

  def create_topic_with_questions *questions
    click_link "Add Topic"
    fill_in "Name", with: "My Topic"
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: questions[0]
    questions[1..-1].each do |question|
    click_link "Add Question"
      last_nested_fields = all(".question").last
      within(last_nested_fields) do
        fill_in "Question", with: question
      end
    end
    click_button "Create topic"
  end
end

RSpec.configure do |config|
  config.include TopicsHelper
end

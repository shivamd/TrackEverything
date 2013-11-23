module TopicsHelper
  def create_topic_with_name name
    click_link "Add Topic"
    fill_in "Name", with: name
    find(:css, "input[id='topic_time']").set "6:00pm"
    fill_in "Question", with: "Why am I here?"
    click_button "Create topic"
  end
end

RSpec.configure do |config|
  config.include TopicsHelper
end

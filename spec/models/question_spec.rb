require 'spec_helper'

describe Question do
  it { should belong_to(:topic) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:topic) }
  it { should have_many(:answers) }
end

describe Question, "#topic" do
  it "makes sure question belongs to topic" do
    topic = create(:topic)
    question = topic.questions.build(content: "how are you?")
    expect(topic.questions.first.content).to eq "how are you?"
  end
end

# == Schema Information
#
# Table name: topics
#
#  id        :integer          not null, primary key
#  name      :string(255)      not null
#  frequency :string(255)      not null
#

require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:frequency) }
  it { should validate_presence_of(:time) }
  it { should ensure_inclusion_of(:frequency).in_array(%w(day weekday sunday monday tuesday wednesday thursday friday saturday monthly)) }
  it { should have_many(:users).through(:users_topics) }
  it { should have_many(:users_topics) }

  it { should have_many(:questions) }

end

describe Topic, "#users" do
  it "assigns user from the user added to the topic" do 
    user = User.new(email: "person@example.com", password: "password")
    topic = Topic.new 
    topic.users << user
    expect(topic.users.first.email).to eq "person@example.com"
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'spec_helper'

describe User do
  it { should have_many(:topics).through(:users_topics) }
  it { should have_many(:users_topics) }
  it { should have_many(:answers) }
end

describe User, "#topics" do
  it "returns topics whose user is the user created with" do
    user = create(:user)
    user.topics.create(name: "my topic")
    create(:topic, name: "not my topic")
    expect(user.topics.length).to eq 1
    expect(user.topics.first.name).to eq "my topic"
  end
end


describe User, "#email" do
  it "returns the email the user was instantiated with" do 
    user = create(:user, email: "person@example.com")
    expect(user.email).to eq "person@example.com"
  end
end

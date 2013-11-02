require 'spec_helper' 

describe UsersTopic do 
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:topic_id) }
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
end

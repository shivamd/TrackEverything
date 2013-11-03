require 'spec_helper' 

describe Question do 
  it { should belong_to(:topic) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:topic_id) }
end

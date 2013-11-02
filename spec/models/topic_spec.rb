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
  it { should ensure_inclusion_of(:frequency).in_array(%w(daily weekdays sunday monday tuesday wednesday thursday friday saturday monthly)) }
  it { should have_many(:users).through(:users_topics) }
  it { should have_many(:users_topics) }

end

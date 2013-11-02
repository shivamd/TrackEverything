require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:frequency) }
  it { should ensure_inclusion_of(:frequency).in_array(%w(daily weekdays sunday monday tuesday wednesday thursday friday saturday monthly)) }
end

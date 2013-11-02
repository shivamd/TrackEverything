# == Schema Information
#
# Table name: topics
#
#  id        :integer          not null, primary key
#  name      :string(255)      not null
#  frequency :string(255)      not null
#

class Topic < ActiveRecord::Base
  FREQUENCIES = %w(
    daily
    weekdays
    sunday
    monday
    tuesday
    wednesday
    thursday
    friday
    saturday
    monthly
  )
  validates :name, :frequency, presence: true
  validates :frequency, inclusion: { in: FREQUENCIES }

  has_many :users, through: :users_topics
  has_many :users_topics
end

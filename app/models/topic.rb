# == Schema Information
#
# Table name: topics
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  frequency :string(255)
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
end

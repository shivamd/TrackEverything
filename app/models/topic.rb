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
    day
    weekday
    sunday
    monday
    tuesday
    wednesday
    thursday
    friday
    saturday
    monthly
  )
  validates :name, :frequency, :time, presence: true
  validates :frequency, inclusion: { in: FREQUENCIES }

  has_many :users, through: :users_topics
  has_many :users_topics

  has_many :questions, inverse_of: :topic
  accepts_nested_attributes_for :questions, allow_destroy: true

  def has_user?(user)
    self.users.include?(user) 
  end

end

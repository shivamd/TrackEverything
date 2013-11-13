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

  def self.receive_email(email)
    user = User.find_by_email(email.from)
    if user
      answers = email.body.split(/\r\n\r\n/)
      topic = Topic.find_by_name(email.to.first[:name])
      if topic && topic.has_user?(user)
        topic.questions.each_with_index do |question, i|
          question.create_answer(answers[i])
        end
      end
    end
  end

  def has_user?(user)
    self.users.include?(user)
  end
end

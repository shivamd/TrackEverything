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

  has_many :questions, inverse_of: :topic
  accepts_nested_attributes_for :questions, allow_destroy: true

  def self.receive_mail(email,answers)
    # find the topic and do all the email stuff
    # users_email = email.from
    # id = users_email.match(//)
    # topic = Topic.find_by_id(id)
    # user = User.find_by_email(users_email)
    # if topic.has_user?(user)
    #   topic.questions.each_with_index do |question, i|
    #     question.create_answer(answers[i])
    #   end
    # end
  end

  def has_user?(user)
    topic.users.include?(user)
  end
end

class Question < ActiveRecord::Base
  validates :content, :topic,  presence: true

  has_many :answers
  belongs_to :topic, inverse_of: :questions
end

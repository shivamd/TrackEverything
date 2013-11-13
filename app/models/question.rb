class Question < ActiveRecord::Base
  belongs_to :topic, inverse_of: :questions

  validates :content, :topic,  presence: true

  has_many :answers
  def create_answer(answer, user)
    self.answers.create(content: answer, user_id: user.id) 
  end
end

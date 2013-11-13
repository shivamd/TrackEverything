class Question < ActiveRecord::Base
  belongs_to :topic, inverse_of: :questions

  validates :content, :topic,  presence: true

  has_many :answers
  def create_answer(answer)
    debugger
    #self.answers.create(answer: answer) 
  end
end

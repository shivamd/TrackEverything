class AnswerViaEmail

  def self.process(email)
    new(email).process
  end

  def initialize(email)
    @email = email
  end

  def body
    @email.body
  end
  
  def to
    @email.to
  end

  def process
    create_answers if user_has_topic?
  end

  private

  def create_answers
    questions.each_with_index do |question, i|
      create_answer(answers[i], question)
    end
  end

  def create_answer(answer, question)
    Answer.create(content: answer, user_id: user.id, question_id: question.id)
  end

  def questions
    topic.questions
  end

  def answers
   body.split(/\n+/)
  end

  def user_has_topic?
    topic.has_user?(user) if topic
  end

  def topic
    Topic.find_by_name(to.first[:token])
  end

  def user 
    User.find_by_email(@email.from)
  end
end

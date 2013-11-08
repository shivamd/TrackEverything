class EmailProcessor
  def self.process(email)
    answers = email.body.split(/\r\n\r\n/).delete_if(&:empty?)
    Topic.receive_email(email, answers)
  end
end

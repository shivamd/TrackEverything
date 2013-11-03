class TopicMailer < ActionMailer::Base
  default from: "daryananis@gmail.com"

  def send_questions(user, topic)
    @questions = topic.questions
    @topic = topic
    mail(to: user.email, subject: "Questions for #{topic.name}")
  end
end

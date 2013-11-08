require "./"+ File.dirname(__FILE__) + "/environment.rb"
set :output, "#{path}/log/cron.log"


@users = User.all
@users.each do |user|
  user.topics.each do |topic|
    every topic.frequency.to_sym, at: topic.time do 
      #logic to send email
      runner "Topic.receive_email"
    end
  end
end

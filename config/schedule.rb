require "#{RAILS_ROOT}/config/environment.rb"
set :output, "#{path}/log/cron.log"

every :monday, at: "2:00 AM" do 
end

if Rails.env == "production"
  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :authentication => :plain,
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :domain => 'heroku.com'
  }
else 
  ActionMailer::Base.smtp_settings ={
    address: "smtp.gmail.com",
    port: 587,
    authentication: :plain,
    user_name: ENV['GMAIL_USERNAME'],
    password: ENV['GMAIL_PASSWORD'],
    enable_starttls_auto: true
  }
end


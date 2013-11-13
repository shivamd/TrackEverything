class EmailProcessor < ActiveRecord::Base
  def self.process(email)
    Topic.receive_email(email)
  end
end

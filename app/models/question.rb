class Question < ActiveRecord::Base
  belongs_to :topic, inverse_of: :questions

  validates :content, :topic,  presence: true
end

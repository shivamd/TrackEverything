class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :topic_id
      t.text :content
    end
  end
end

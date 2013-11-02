class CreateUsersTopic < ActiveRecord::Migration
  def change
    create_table :users_topics do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
    end
  end
end

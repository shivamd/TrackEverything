class CreateTopic < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.string :frequency, null: false
    end
  end
end

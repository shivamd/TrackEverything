class AddTimetoTopic < ActiveRecord::Migration
  def up
    add_column :topics, :time, :string
  end
  def down
    remove_column :topics, :time
  end
end

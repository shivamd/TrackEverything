class AddTimetoTopic < ActiveRecord::Migration
  def up
    add_column :topics, :time, :time
  end
  def down
    remove_column :topics, :time
  end
end

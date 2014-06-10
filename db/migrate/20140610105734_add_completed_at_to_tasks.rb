class AddCompletedAtToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completedAt, :date
  end
end

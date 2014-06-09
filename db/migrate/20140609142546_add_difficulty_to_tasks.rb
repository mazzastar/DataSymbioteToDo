class AddDifficultyToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :difficulty, :integer
  end
end

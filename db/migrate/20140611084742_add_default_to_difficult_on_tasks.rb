class AddDefaultToDifficultOnTasks < ActiveRecord::Migration
  def change
  	change_column_default :tasks, :difficulty, 5
  end
end

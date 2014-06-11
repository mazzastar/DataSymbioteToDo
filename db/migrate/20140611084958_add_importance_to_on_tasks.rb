class AddImportanceToOnTasks < ActiveRecord::Migration
  def change
  	change_column_default :tasks, :importance, 5
  end
end

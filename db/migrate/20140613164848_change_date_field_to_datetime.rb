class ChangeDateFieldToDatetime < ActiveRecord::Migration
  def change
  	change_column :tasks, :deadline, :datetime
  end
end

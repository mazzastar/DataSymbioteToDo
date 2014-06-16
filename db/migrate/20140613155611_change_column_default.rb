class ChangeColumnDefault < ActiveRecord::Migration
  def change
  	change_column_default :tasks, :category, 1
  end
end

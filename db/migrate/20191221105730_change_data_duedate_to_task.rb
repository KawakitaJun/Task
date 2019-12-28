class ChangeDataDuedateToTask < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :duedate, :date
  end
end

class ChangeAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :admin, :boolean
  end
end

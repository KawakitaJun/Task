class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :authority, :boolean
    add_column :users, :admin, :boolean
    add_reference :users, :department, foreign_key: true
  end
end

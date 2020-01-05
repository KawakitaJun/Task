class AddDefaultToUserAuthority < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :authority, false)
  end
end

class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end

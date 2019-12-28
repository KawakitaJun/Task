class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true
      t.references :category, foreign_key: true
      t.references :status, foreign_key: true
      t.string :name
      t.text :content 
      t.datetime :duedate

      t.timestamps
    end
  end
end

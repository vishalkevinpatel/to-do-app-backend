class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.date :deadline
      t.boolean :completed
      t.integer :category_id

      t.timestamps
    end
  end
end

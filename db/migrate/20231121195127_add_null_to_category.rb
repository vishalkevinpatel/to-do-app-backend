class AddNullToCategory < ActiveRecord::Migration[7.0]
  def change
    change_column_null :todos, :completed, to: false
  end
end

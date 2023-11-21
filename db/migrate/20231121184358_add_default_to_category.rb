class AddDefaultToCategory < ActiveRecord::Migration[7.0]
  def change
    change_column_default :categories, :name, from: nil, to: "unsorted"
  end
end

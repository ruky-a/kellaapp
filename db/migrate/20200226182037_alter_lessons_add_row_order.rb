class AlterLessonsAddRowOrder < ActiveRecord::Migration[6.0]
  def change
     add_column :lessons, :row_order, :integer
    add_index :lessons, :row_order
  end
end

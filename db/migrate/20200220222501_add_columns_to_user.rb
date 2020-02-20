class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about, :text
    add_column :users, :status, :boolean, default: false
  end
end

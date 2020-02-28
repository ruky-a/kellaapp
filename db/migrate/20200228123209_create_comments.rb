class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    add_index :comments, [:user_id, :course_id]
    add_index :comments, :course_id
  end
end

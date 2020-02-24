class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :course_id
      t.timestamps
    end
    add_index :sections, :course_id
  end
end

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user
      t.text :review
      t.integer :stars, default: 1

      t.timestamps
    end
  end
end

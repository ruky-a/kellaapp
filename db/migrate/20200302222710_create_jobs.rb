class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :url
      t.text :description
      t.integer :salary
      t.string :location
      t.string :city
      t.string :state
      t.string :email
      t.string :qualifications
      t.string :benefits
      t.integer :deadline

      t.timestamps
    end
  end
end

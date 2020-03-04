class CreateJobapplications < ActiveRecord::Migration[6.0]
  def change
    create_table :jobapplications, id: :uuid do |t|
      t.integer :status, default: 0
       t.integer :user_id
      t.integer :job_id
      t.string :firstname
      t.string :lastname
      t.integer :phone
      t.string :title
      t.text :message
      t.string :email

      t.timestamps
    end
    add_index :jobapplications, [:user_id, :job_id]
    add_index :jobapplications, :job_id
  end
end


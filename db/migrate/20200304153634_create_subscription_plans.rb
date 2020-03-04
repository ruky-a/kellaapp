class CreateSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_plans do |t|
      t.string :plan_id
      t.string :sub_id
      t.integer :status, default: 0
      t.date :expired_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

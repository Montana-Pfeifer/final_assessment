class CreateCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_subscriptions, id: false do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.timestamps
    end

    add_index :customer_subscriptions, [:customer_id, :subscription_id], unique: true
  end
end
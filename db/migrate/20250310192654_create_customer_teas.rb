class CreateCustomerTeas < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_teas, id: false do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true
      t.integer :rating
      t.boolean :favorite, default: false
      t.text :review
      t.timestamps
    end

    add_index :customer_teas, [:customer_id, :tea_id], unique: true
  end
end

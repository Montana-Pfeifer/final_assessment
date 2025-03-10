class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :title, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :status
      t.string :frequency, comment: 'Daily, Weekly, Monthly, etc.'
      t.timestamps
    end
  end
end
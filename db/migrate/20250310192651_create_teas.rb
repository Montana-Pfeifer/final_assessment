class CreateTeas < ActiveRecord::Migration[7.0]
  def change
    create_table :teas do |t|
      t.string :title, null: false
      t.text :description
      t.integer :temperature, comment: 'Ideal brewing temperature in Fahrenheit or Celsius'
      t.integer :brew_time, comment: 'Recommended brewing time in minutes'
      t.timestamps
    end
  end
end
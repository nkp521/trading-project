class CreateStrategies < ActiveRecord::Migration[8.0]
  def change
    create_table :strategies do |t|
      t.string :name
      t.string :description
      t.string :long_entry
      t.string :short_entry
      t.string :risk_level

      t.timestamps
    end
  end
end

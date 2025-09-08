class CreateUserStrategies < ActiveRecord::Migration[8.0]
  def change
    create_table :user_strategies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :strategy, null: false, foreign_key: true

      t.timestamps
    end
  end
end

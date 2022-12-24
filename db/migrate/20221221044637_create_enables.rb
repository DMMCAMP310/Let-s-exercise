class CreateEnables < ActiveRecord::Migration[6.1]
  def change
    create_table :enables do |t|
      t.string :name
      t.integer :ratio
      t.integer :plan_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

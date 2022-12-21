class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

class CreateMerits < ActiveRecord::Migration[6.1]
  def change
    create_table :merits do |t|
      t.string :title
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

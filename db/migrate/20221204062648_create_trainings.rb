class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :goal, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :introduction
      t.string :result
      t.text :food
      t.string :goal
      t.integer :user_id

      t.timestamps
    end
  end
end

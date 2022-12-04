class CreateTrainingComments < ActiveRecord::Migration[6.1]
  def change
    create_table :training_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :training_id

      t.timestamps
    end
  end
end

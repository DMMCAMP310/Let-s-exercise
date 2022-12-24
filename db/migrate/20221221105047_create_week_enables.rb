class CreateWeekEnables < ActiveRecord::Migration[6.1]
  def change
    create_table :week_enables do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true
      t.boolean :checked, null: false, default: false

      t.timestamps
    end
  end
end

class CreateWeekEnables < ActiveRecord::Migration[6.1]
  def change
    create_table :week_enables do |t|
      t.references :enable, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
  end
end

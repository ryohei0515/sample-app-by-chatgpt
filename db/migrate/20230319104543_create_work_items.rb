class CreateWorkItems < ActiveRecord::Migration[6.1]
  def change
    create_table :work_items do |t|
      t.references :daily_report, null: false, foreign_key: true
      t.string :category
      t.string :task
      t.integer :work_hours

      t.timestamps
    end
  end
end

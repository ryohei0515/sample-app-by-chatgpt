class CreateDailyReports < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.date :work_date
      t.string :category
      t.string :task
      t.integer :work_hours

      t.timestamps
    end
  end
end

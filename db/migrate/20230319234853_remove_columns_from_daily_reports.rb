class RemoveColumnsFromDailyReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :daily_reports, :category, :string
    remove_column :daily_reports, :task, :string
    remove_column :daily_reports, :work_hours, :integer
  end
end

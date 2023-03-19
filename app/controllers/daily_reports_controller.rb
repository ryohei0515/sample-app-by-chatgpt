class DailyReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_reports = current_user.daily_reports.all.order(work_date: :desc)
  end

  def new
    @daily_report = current_user.daily_reports.new
  end

  def create
    @daily_report = current_user.daily_reports.new(daily_report_params)
    if @daily_report.save
      redirect_to daily_reports_path, notice: '日報が作成されました。'
    else
      render :new
    end
  end

  private

  def daily_report_params
    params.require(:daily_report).permit(:user_id, :work_date, :category, :task, :work_hours)
  end
end

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

  def edit
    @daily_report = current_user.daily_reports.find(params[:id])
  end

  def update
    @daily_report = current_user.daily_reports.find(params[:id])
    if @daily_report.update(daily_report_params)
      redirect_to daily_reports_path, notice: '日報が更新されました。'
    else
      render :edit
    end
  end

  private

  def daily_report_params
    def daily_report_params
      params.require(:daily_report).permit(:date, work_items_attributes: [:id, :category, :task, :work_hours, :_destroy])
    end
  end
end

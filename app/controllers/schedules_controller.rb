class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo))
    if @schedule.save
      flash[:notice] = "予定を登録しました"
      redirect_to :schedules
    else
      flash.now[:alert] = "予定の登録に失敗しました"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :startdate, :enddate, :allday, :memo))
      flash[:notice] = "ユーザーIDが「#{@schedule.id}」の情報を更新しました"
      redirect_to :schedules
    else
      flash.now[:alert] = "情報の更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to :schedules
    else
      flash[:alert] = "ユーザーの削除に失敗しました"
      redirect_to :schedules
    end
  end
    
end

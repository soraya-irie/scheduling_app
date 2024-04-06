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
    render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

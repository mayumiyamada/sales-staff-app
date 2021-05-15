class CalendarsController < ApplicationController

  def index
    @calendars = current_user.calendars
  end

  def new
    @calendar = current_user.calendars.new
  end

  def show
    @calendar = current_user.calendars.find(params[:id])
  end

  def edit
    @calendar = current_user.calendars.find(params[:id])
  end

  def update
    @calendar= current_user.calendars.find(params[:id])
    @calendar.update(calendar_params)
    redirect_to calendars_path
  end

  def create
    @calendar = current_user.calendars.new(calendar_params)
    if @calendar.save
      redirect_to action: :index
    else
      redirect_to new_calendar_path
    end
  end

  def destroy
    @calendar = current_user.calendars.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path
  end


  private
  def calendar_params
    params.require(:calendar).permit(:start_time, :title, :content).merge(user_id: current_user.id)
  end
end
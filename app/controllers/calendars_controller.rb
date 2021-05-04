class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :show, :destroy, :update]
  def index
    @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
  if @calendar.save
     redirect_to action: :index
    else
      render :new
    end
  end

  def show 
  end 

  def edit
  end

  def update
  if @calendar.update(calendar_params)
    redirect_to action: :index
  else
    render :edit
    end
  end

  def destroy
    @calendar.destroy
    redirect_to action: :index
  end

  private
  def calendar_params
    params.require(:calendar).permit(:title, :content, :start_time)
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end  
end

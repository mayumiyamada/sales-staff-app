class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to action: :index
    else
      render :new
  end
end

def destroy
   @room = Room.find(params[:id])
   @room.destroy
   redirect_to action: :index
end

private 

def room_params
  params.require(:room).permit(:subject, user_ids: [])
 end
end

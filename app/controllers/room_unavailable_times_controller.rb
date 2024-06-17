class RoomUnavailableTimesController < ApplicationController
  before_action :set_room_unavailable_time, only: %i[ show update destroy ]

  # # GET /room_unavailable_times
  # def index
  #   @room_unavailable_times = RoomUnavailableTime.all

  #   render json: @room_unavailable_times
  # end

  # # GET /room_unavailable_times/1
  # def show
  #   render json: @room_unavailable_time
  # end

  # POST /room_unavailable_times
  def create
    @room = Room.find params[:room_id]
    @room_unavailable_time = @room.unavailable_times.new(unavailable_time_params)

    if @room_unavailable_time.save
      render json: @room, include: [:unavailable_times], status: :created, location: @room
    else
      render json: @room_unavailable_time.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /room_unavailable_times/1
  # def update
  #   if @room_unavailable_time.update(room_unavailable_time_params)
  #     render json: @room_unavailable_time
  #   else
  #     render json: @room_unavailable_time.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /room_unavailable_times/1
  def destroy
    @room_unavailable_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_unavailable_time
      @room_unavailable_time = RoomUnavailableTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unavailable_time_params
      params.require(:unavailable_time).permit(:date, :from, :to, :fullday)
    end
end

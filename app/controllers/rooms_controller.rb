class RoomsController < ApplicationController
  before_action :authorized

  def index
    @rooms = Room.all

    render json: @rooms, date_from: params[:date_from], date_to: params[:date_to]
  end
end

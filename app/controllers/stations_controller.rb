class StationsController < ApplicationController
  before_action :set_point
  before_action :set_station, except: [:new, :create]
  def show
    @connectors = @station.connectors.all
  end

  def new
    @station = @point.station.new
  end

  def create
    @station = @point.station.create station_params
    if @station.save
      redirect_to point_path(@point)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @station.destroy

    redirect_to point_path(@point), status: :see_other
  end

  def edit
  end

  def update
    if @station.update station_params
      redirect_to point_path @point
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def station_params
    params.require(:station).permit(:serial_number)
  end

  def set_point
    @point = Point.find(params[:point_id])
  end

  def set_station
    @station = Station.find(params[:id])
  end
end

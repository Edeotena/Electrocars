class ConnectorsController < ApplicationController
  def new
    @station = Station.find(params[:station_id])
    @point = Point.find(@station.point_id)
    @connector = @station.connectors.new
  end

  def create
    @station = Station.find(params[:station_id])
    @point = Point.find(@station.point_id)
    @connector = @station.connectors.create connector_params
    if @connector.save
      redirect_to point_path(@station)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def connector_params
    params.require(:connector).permit(:type, :power)
  end

end

class ConnectorsController < ApplicationController
  before_action :set_point_and_station
  before_action :set_connector, except: [:new, :create]
  def show
  end
  def new
    @connector = @station.connectors.new
  end

  def create
    @connector = @station.connectors.create connector_params
    if @connector.save
      redirect_to point_station_path(@point, @station)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @connector.update connector_params
      redirect_to point_station_connector_path(@point, @station, @connector)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @connector.destroy

    redirect_to point_station_path(@point, @station)
  end

  private
  def connector_params
    params.require(:connector).permit(:connector_type, :power)
  end

  def set_point_and_station
    @point = Point.find(params[:point_id])
    @station = Station.find(params[:station_id])
  end

  def set_connector
    @connector = Connector.find(params[:id])
  end

end

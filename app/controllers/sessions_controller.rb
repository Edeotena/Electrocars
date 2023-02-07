class SessionsController < ApplicationController
  def create
    @session = Session.create session_params
    set_back_params
    redirect_to point_station_connector_path(@point, @station, @connector)
  end
  def stop
    @session = Session.find(params[:id])
    set_back_params
    Session.update(@session.id, status: 'disable')
    redirect_to point_station_connector_path(@point, @station, @connector)
  end

  private
  def session_params
    params.require(:session).permit(:client_id, :energy).merge(status: "active", connector_id: params[:connector_id])
  end

  def set_back_params
    @connector = Connector.find(@session.connector_id)
    @station = Station.find(@connector.station_id)
    @point = Point.find(@station.point_id)
  end
end

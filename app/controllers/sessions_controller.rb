class SessionsController < ApplicationController
  def index
    @sessions = Session.all

    render json: @sessions
  end

  def show
    @session = Session.find(params[:id])
    @client = Client.find(@session.client_id)
    @point = Point.find(Station.find(Connector.find(@session.connector_id).station_id).point_id)
    render json: { "session": @session,
      "client": [ @client.phone_number, @client.full_name ],
      "point": @point.name }.to_json
  end

  def create
    @session = Session.new session_params
    respond_to do |format|
      if @session.save
        set_back_params
        format.html { redirect_to point_station_connector_path(@point, @station, @connector) }
        format.json { render :show, status: :created, location: @session }
      else
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end
  def stop
    @session = Session.find(params[:id])
    @session.status = 'disable'
    respond_to do |format|
      if @session.save
        set_back_params
        format.html { redirect_to point_station_connector_path(@point, @station, @connector) }
        format.json { render :show, status: :created, location: @session }
      else
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end

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

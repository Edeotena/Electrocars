class StationsController < ApplicationController
  def show
    @point = Point.find(params[:id])
    @station = Station.find(params[:point_id])
  end

  def new
    @point = Point.find(params[:point_id])
    @station = @point.station.new
  end

  def create
    @point = Point.find(params[:point_id])
    @station = @point.station.create station_params
    if @station.save
      redirect_to point_path(@point)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @station = Station.find(params[:point_id])
    @point = Point.find(params[:id])
    @station.destroy

    redirect_to point_path(@point), status: :see_other
  end

  def edit
    @point = Point.find(params[:id])
    @station = Station.find(params[:point_id])
  end

  def update
    @point = Point.find(params[:id])
    @station = Station.find(params[:point_id])

    if @point.save
      redirect_to point_path @point
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def station_params
    params.require(:station).permit(:serial_number)
  end
end

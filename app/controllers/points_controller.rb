class PointsController < ApplicationController
  def index
    @points = Point.all
  end

  def show
    @point = Point.find(params[:id])
    @stations = @point.station.all
  end

  def new
    @point = Point.new
  end

  def create
    @point = Point.new point_params

    if @point.save
      redirect_to points_path
      else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @point = Point.find(params[:id])
  end

  def destroy
    @point = Point.find(params[:id])
    @point.destroy

    redirect_to root_path, status: :see_other
  end

  def update
    @point = Point.find(params[:id])

    if @point.save
      redirect_to points_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def point_params
      params.require(:point).permit(:name, :latitude, :longitude)
    end

end

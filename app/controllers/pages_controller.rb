class PagesController < ApplicationController
  def index
    @points = Point.all
  end
end

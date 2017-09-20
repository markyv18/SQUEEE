class ToursController < ApplicationController

  def index
    if params[:format]
      @yelp_tours = ToursPresenter.new(params[:format])
    else
      @yelp_tours = ToursPresenter.new("Denver")
    end
  end

  def show
    @yelp_tour = TourPresenter.new(params[:id]).tour
  end
end

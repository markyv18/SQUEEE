class ToursController < ApplicationController

  def index
    if params[:city]
      @yelp_tours = ToursPresenter.new(params[:city])
    else
      @yelp_tours = ToursPresenter.new("Denver")
    end
  end

  def show

  end
end

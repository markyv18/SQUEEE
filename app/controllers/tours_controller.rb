class ToursController < ApplicationController

  def index
    if params[:city]
      @tours = ToursPresenter.new(params[:city])
    else
      @tours = ToursPresenter.new("Denver")
    end
  end

  def show

  end
end

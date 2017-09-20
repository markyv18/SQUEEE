class Api::V1::Trips::ItinerariesController < ApplicationController
  def destroy
    Trip.find(params[:id]).delete_itinerary(params[:date], params[:name])
  end
end

class Api::V1::Trips::ItinerariesController < ApplicationController
  def destroy
    Itinerary.find(params[:it_id]).delete
  end
end

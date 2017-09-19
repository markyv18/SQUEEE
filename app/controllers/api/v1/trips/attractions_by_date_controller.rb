class Api::V1::Trips::AttractionsByDateController < ApplicationController
  def index
    trip = Trip.find(params[:id])
    attractions = trip.places.joins(:itineraries).where(itineraries: {date: params[:date]}).map do |place|
      raw_data = GooglePlacesService.fetch_details(place.google_place_id)
      Attraction.new(raw_data)
    end
    render json: ActiveModel::Serializer::CollectionSerializer.new(attractions, each_serializer: AttractionSerializer)
  end
end

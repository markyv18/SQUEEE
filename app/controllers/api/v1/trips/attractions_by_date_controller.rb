class Api::V1::Trips::AttractionsByDateController < ApplicationController
  def index
    attractions = Trip.find(params[:id]).attractions_by_date(params[:date])
    render json: ActiveModel::Serializer::CollectionSerializer
                  .new(attractions, each_serializer: AttractionSerializer)
  end
end

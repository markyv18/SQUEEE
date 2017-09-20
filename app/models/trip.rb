class Trip < ApplicationRecord
  after_create :email_trip

  belongs_to :user
  belongs_to :city
  has_many :itineraries
  has_many :places, through: :itineraries

  validates_presence_of :start_city
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :user_id

  def with_dates
    "#{start_city}, #{start_date} - #{end_date}"
  end

  def days
    return [] unless start_date && end_date
    (start_date..end_date).to_a
  end

  def sorted_itineraries
    self.itineraries.order(:date)
  end

  def places_by_date(date)
    places
      .joins(:itineraries)
      .where(itineraries: {date: date})
  end

  def attractions_by_date(date)
    places_by_date(date).map do |place|
      raw_data = GooglePlacesService.fetch_details(place.google_place_id)
      Attraction.new(raw_data)
    end

  def email_trip
    SendTripJob.perform_later(self)
    SendTripJob.set(wait_until: (self.start_date - 1.day).to_s).perform_later(self)
  end
end

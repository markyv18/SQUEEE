class ToursPresenter
  attr_reader :tours, :city

  def initialize(city)
    @tours = []
    @city  = city
    compile_tours_presenter
  end

  def compile_tours_presenter
    @tours = YelpToursService.retrieve_tours_for_city(city)[:businesses].map do |tour|
      CityTour.new(tour)
    end
  end
end

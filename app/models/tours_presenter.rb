class ToursPresenter
  attr_reader :tours, :city

  def initialize(city)
    @tours = []
    @city  = city
    compile_tours_presenter
  end

  def compile_tours_presenter
    binding.pry
    YelpToursService.retrieve_tours_for_city(city)
  end
end

class TourPresenter
  attr_reader :tour

  def initialize(id)
    @tour = nil
    compile_tour(id)
  end

  def compile_tour(id)
    @tour = YelpTour.new(YelpToursService.retrieve_tour(id))
  end
end

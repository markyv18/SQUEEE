class CityTour
  attr_reader :id,
              :name,
              :image_url,
              :url,
              :rating,
              :address,
              :phone,
              :location,
              :categories

  def initialize(attrs)
    @id         = attrs[:id]
    @name       = attrs[:name]
    @image_url  = attrs[:image_url]
    @url        = attrs[:url]
    @rating     = attrs[:rating].to_s
    @address    = attrs[:location][:display_address]
    @phone      = attrs[:display_phone]
    @location   = {}
    @categories = []
    compile_location(attrs[:coordinates])
    compile_categories(attrs[:categories])
  end

  def compile_categories(attrs)
    @categories = attrs.map do |category|
      category[:title]
    end
  end

  def compile_location(location)
    @location = {:lat=> location[:latitude].to_s, :long=>location[:longitude].to_s}
  end
end

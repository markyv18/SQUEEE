class YelpTour
  attr_reader :id,
              :name,
              :image_url,
              :url,
              :rating,
              :address,
              :phone,
              :location,
              :categories,
              :photos

  def initialize(attrs)
    @id         = attrs[:id]
    @name       = attrs[:name]
    @image_url  = attrs[:image_url]
    @url        = attrs[:url]
    @rating     = attrs[:rating].to_i
    @address    = attrs[:location][:display_address]
    @phone      = attrs[:display_phone]
    @location   = compile_location(attrs[:coordinates])
    @categories = compile_categories(attrs[:categories])
    @photos     = attrs[:photos]
  end

  def compile_categories(categories)
    categories.map do |category|
      category[:title]
    end
  end

  def compile_location(location)
    {:lat=> location[:latitude].to_s, :long=>location[:longitude].to_s}
  end
end

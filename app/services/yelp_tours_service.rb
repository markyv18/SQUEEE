class YelpToursService
  def initialize
    @conn = Faraday.new("https://api.yelp.com")
  end

  def self.retrieve_tours_for_city(city, limit = 10)
    new.retrieve_tours_for_city(city, limit)
  end

  def retrieve_tours_for_city(city, limit)
    response = @conn.get do |req|
      req.url "/v3/businesses/search"
      req.params['location']       = city
      req.params['categories']     = "tours"
      req.params['limit']           = limit
      req.headers['Authorization'] = "bearer #{ENV['yelp_token']}"
    end
    parse_json(response)
  end

  private

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end

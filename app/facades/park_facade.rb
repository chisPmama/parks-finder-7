class ParkFacade  
  def get_parks(state)
    @service = ParkService.new
    @park_data = parse_json(@service.get_parks(state))
  end

  def parse_json(data)
    data = JSON.parse(data.body, symbolize_names: true)[:data]
    parks = data.map do |d|
      Park.new(d)
    end
  end
end
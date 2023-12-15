class ParkService
  def conn
    conn = Faraday.new(url: "https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.nps_gov[:key]
    end
  end

  def get_parks(state)
    response = conn.get("/api/v1/parks/?stateCode=#{state}")
  end
end
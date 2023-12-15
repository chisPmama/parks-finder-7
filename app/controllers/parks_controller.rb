class ParksController < ApplicationController

  def search
    @state = params[:state]
    
    conn = Faraday.new("https://developer.nps.gov") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.nps_gov[:key]
    end

    response = conn.get("/api/v1/parks/?stateCode=#{@state}")

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    @park_results = data.map do |park|
      Park.new(park)
    end
  end

end
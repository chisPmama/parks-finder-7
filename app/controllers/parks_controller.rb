class ParksController < ApplicationController

  def search
    @state = params[:state]
    
    @facade = ParkFacade.new
    @park_results = @facade.get_parks(@state)
  end

end
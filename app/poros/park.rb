class Park
  attr_reader :id, :full_name, :description, :directions, :hours

  def initialize(data)
    @id = data[:id]
    @full_name = data[:fullName]
    @description = data[:description]
    @directions = data[:directionsInfo]
    @hours = data[:operatingHours].first[:standardHours]
  end
end
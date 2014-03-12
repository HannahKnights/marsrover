require_relative 'rover'

class Mars

  def initialize(top_corner, rovers_mission)
    initialize_plateau(top_corner)
    initialize_rovers(rovers_mission)
  end

  attr_reader :plateau, :rovers

  def initialize_plateau(top_corner)
    coord_data = top_corner.split('')
    x_coord, y_coord = coord_data[0].to_i, coord_data[0].to_i
    @plateau = Array.new(x_coord + 1) { (0..y_coord).to_a }
  end

  def initialize_rovers(rovers_mission)
    rovers = rovers_mission.scan(/\d{2}[A-Z]+/)
    @rovers = []
    rovers.each do |rover| 
      create_rover(rover) 
    end
  end

  def create_rover(rover)
    direction = rover.slice!(2)
    coords = rover.slice!(0..1).split('').map {|value| value.to_i}
    mission = rover
    @rovers << Rover.new(direction, coords, mission)
  end

  def launch_mission
    rovers.map do |rover|
      rover.set_off
      rover.position*'' + rover.compass
    end
  end

end



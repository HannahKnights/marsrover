require_relative 'rover'

class Mars

  def initialize(top_corner, instructions)
    initialize_plateau(top_corner)
    initialize_rovers(instructions)
  end

  attr_reader :plateau, :rovers

  def initialize_plateau(top_corner)
    coord_data = top_corner.split('')
    x_coord, y_coord = coord_data[0].to_i, coord_data[0].to_i
    @plateau = Array.new(x_coord + 1) { (0..y_coord).to_a }
  end

  def initialize_rovers(instructions)
    rovers = instructions.scan(/\d{2}[A-Z]+/)
    @rovers = []
    rovers.each do |rover_mission| 
       @rovers << create_rover(rover_mission) 
    end
  end

  def create_rover(rover_mission)
    orientation = rover_mission.slice!(2)
    coords = rover_mission.slice!(0..1).split('').map {|value| value.to_i}
    mission = rover_mission
    Rover.new(orientation, coords, mission)
  end

  def launch_mission
    rovers.map do |rover|
      rover.set_off
      rover.position*'' + rover.orientation
    end
  end

end



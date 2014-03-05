class Rover

  def initialize(direction, coordinates)
    @compass  = direction
    @position = coordinates
  end

  attr_reader :compass, :position

  def compass= direction
    compass_points = ['N', 'S', 'E', 'W']
    compass_points.include?(direction) ? @compass = direction : nil
  end

  def set_off(mission)
    route = mission.split('')
    route.each do |direction|
      direction == 'M' ? moveforward : rotate(direction)
    end
  end

  def rotate(direction)
    compass_points = ['N', 'E', 'S', 'W']
    current = compass_points.find_index(@compass)
    direction == 'R' ? @compass = compass_points[current + 1] : compass=compass_points[current - 1]
  end

end






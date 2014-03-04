class Rover

  def initialize(direction)
    @compass  = direction
  end

  attr_reader :compass

  def compass= direction
    compass_points = ['N', 'S', 'E', 'W']
    compass_points.include?(direction) ? @compass = direction : nil
  end


end
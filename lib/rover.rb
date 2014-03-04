class Rover

  def initialize(direction)
    @direction  = direction
  end

  attr_reader :direction

  def direction= direction
    compass = ['N', 'S', 'E', 'W']
    compass.include?(direction) ? @direction = direction : nil
  end


end
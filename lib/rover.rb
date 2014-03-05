class Rover

  COMPASS_POINTS = ['N', 'E', 'S', 'W']

  def initialize(direction, coordinates)
    @compass  = direction
    @position = coordinates
  end

  attr_reader :compass, :position

  def compass= direction
    COMPASS_POINTS.include?(direction) ? @compass = direction : nil
  end

  def set_off(mission)
    route = mission.split('')
    route.each do |direction|
      direction == 'M' ? moveforward : rotate(direction)
    end
  end

  def rotate(direction)
    current = COMPASS_POINTS.find_index(@compass)
    direction == 'R' ? right(current) : left(current)
  end

  def left(current)
    current == 0 ? @compass = COMPASS_POINTS[3] : @compass = COMPASS_POINTS[current - 1]
  end

  def right(current)
    current == 3 ? @compass = COMPASS_POINTS[0] : @compass = COMPASS_POINTS[current + 1]
  end

  def moveforward
    if @compass == 'N'
      @position = [ x_coord , y_coord + 1 ]
    elsif @compass == 'S'
      @position = [ x_coord , y_coord - 1 ]
    elsif @compass == 'E'
      @position = [ x_coord + 1 , y_coord ]
    elsif @compass == 'W'
      @position = [ x_coord - 1 , y_coord ]
    end
  end

  def x_coord
    @position[0]
  end

  def y_coord
    @position[1]
  end

end






class Rover

  COMPASS_POINTS = {'N' => [ 0 , 1 ], 'E' => [ 1, 0 ], 'S' => [ 0 , -1 ], 'W' => [ -1 , 0 ]}

  def initialize(direction, coordinates, mission = '')
    @compass  = direction
    @position = coordinates
    @mission = mission
    @x_coord = @position[0]
    @y_coord = @position[1]
  end

  attr_reader :compass, :position, :mission

  def compass= direction
    COMPASS_POINTS.has_key?(direction) ? @compass = direction : nil
  end

  def set_off
    route = @mission.split('')
    route.each do |direction|
      direction == 'M' ? move_forward : rotate(direction)
    end
  end

  def rotate(direction)
    current = COMPASS_POINTS.keys.to_a.find_index(@compass)
    direction == 'R' ? right(current) : left(current)
  end

  def left(current)
    current == 0 ? @compass = COMPASS_POINTS.keys.to_a[3] : @compass = COMPASS_POINTS.keys.to_a[current - 1]
  end

  def right(current)
    current == 3 ? @compass = COMPASS_POINTS.keys.to_a[0] : @compass = COMPASS_POINTS.keys.to_a[current + 1]
  end

  def move_forward
    route = COMPASS_POINTS[@compass]
    @position = [@position, route].transpose.map {|coord| coord.reduce(:+)} 
  end

end

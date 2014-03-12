class Rover

  COMPASS_POINTS = {'N' => [ 0 , 1 ], 'E' => [ 1, 0 ], 'S' => [ 0 , -1 ], 'W' => [ -1 , 0 ]}

  def initialize(direction, coordinates, mission = '')
    @compass  = direction
    @position = coordinates
    @mission = mission
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
    comp = COMPASS_POINTS.keys.to_a
    direction == 'L' ? comp.reverse! : nil
    current = comp.find_index(@compass)
    current == 3 ? @compass = comp[0] : @compass = comp[current + 1]
  end

  def move_forward
    route = COMPASS_POINTS[@compass]
    @position = [@position, route].transpose.map {|coord| coord.reduce(:+)} 
  end

end

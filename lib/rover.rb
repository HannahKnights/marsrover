class Rover

  COMPASS_MAP = {'N' => [ 0 , 1 ], 'E' => [ 1, 0 ], 'S' => [ 0 , -1 ], 'W' => [ -1 , 0 ]}

  def initialize(direction, coordinates, mission = '')
    @orientation = direction
    @position = coordinates
    @mission = mission
  end

  attr_reader :orientation, :position, :mission

  def orientation= direction
    COMPASS_MAP.has_key?(direction) ? @orientation = direction : nil
  end

  def set_off
    @mission.split('').each do |instruction|
      instruction == 'M' ? move_forward : rotate(instruction)
    end
  end

  def move_forward
    movement = COMPASS_MAP[@orientation]
    @position = [@position, movement].transpose.map {|coord| coord.reduce(:+)} 
  end

  def rotate(direction)
    direction == 'L' ? compass_points = COMPASS_MAP.keys.to_a.reverse : compass_points = COMPASS_MAP.keys.to_a
    @orientation = new_direction(compass_points)
  end

  def new_direction(compass_points)
    current = compass_points.find_index(@orientation)
    current == 3 ? @orientation = compass_points[0] : @orientation = compass_points[current + 1]
  end

end

class Mars

  def initialize(top_corner)
    coord_data = top_corner.split('')
    x_coord, y_coord = coord_data[0].to_i, coord_data[0].to_i
    @plateau = Array.new(x_coord + 1) { (0..y_coord).to_a }
  end

  attr_reader :plateau

end
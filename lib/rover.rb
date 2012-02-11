class Rover

  def initialize plateau, coordinates
    coordinates = coordinates.split
    @navigator = Navigator.new(plateau, coordinates[0].to_i, coordinates[1].to_i, coordinates[2])
  end

  def explore instructions
    @navigator.move(instructions)
  end

end

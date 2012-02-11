require_relative 'lib/plateau'
require_relative 'lib/orientation'
require_relative 'lib/navigator'
require_relative 'lib/rover'

plateau = Plateau.new(5,5)

rover1 = Rover.new(plateau, '1 2 N')
puts rover1.explore('LMLMLMLMM')

rover2 = Rover.new(plateau, '3 3 E')
puts rover2.explore('MMRMMRMRRM')

class Navigator

  def initialize plateau, x, y, orientation
    @plateau, @x, @y = plateau, x, y
    raise ArgumentError, "Invalid landing coordinates" unless coordinates_exist?
    @orientation = Orientation.new(orientation)
  end

  def move instructions
    instructions = instructions.scan(/./)
    instructions.each do |instruction|
      case instruction
        when "M" then move_foward
        when "L" then @orientation.rotate(-90)
        when "R" then @orientation.rotate(90)
      end
    end
    coordinates
  end

  private

  def coordinates_exist?
    @plateau.x.include?(@x) && @plateau.y.include?(@y)
  end

  def coordinates
    "#{@x} #{@y} #{@orientation.direction}"
  end

  def move_foward
    case @orientation.direction
      when 'N' then @y += 1
      when 'E' then @x += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
    end
    raise ArgumentError, "Invalid instruction, coordinate doesn't exist" unless coordinates_exist?
  end

end

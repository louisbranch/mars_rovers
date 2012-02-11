class Plateau

  attr_reader :size

  def initialize x1, x2, y1, y2
    @size = [[x1,y1],[x2,y2]]
  end

end

class Orientation

  attr_reader :direction

  def initialize direction
    @direction = direction
  end

  def rotate degree
    puts "rotating #{degree} degree"
    new_angle = cardinal_to_angle + degree
    @direction = angle_to_cardinal(new_angle)
    puts "now facing #{@direction}"
  end

  private

  def angle_to_cardinal angle
    case angle
      when -90 then 'W'
      when 0   then 'N'
      when 90  then 'E'
      when 180 then 'S'
      when 270 then 'W'
      when 360 then 'N'
    end
  end

  def cardinal_to_angle
    case @direction
      when 'N' then 0
      when 'E' then 90
      when 'S' then 180
      when 'W' then 270
    end
  end

end

class Navigator

  def initialize x, y, orientation
    @x, @y = x, y
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
  end

  def coordinates
    "#{@x} #{@y} #{@orientation.direction}"
  end

  private

  def move_foward
    puts "moving forward"
    case @orientation.direction
      when 'N' then @y += 1
      when 'E' then @x += 1
      when 'S' then @y -= 1
      when 'W' then @x -= 1
    end
    puts "now at #{coordinates}"
  end

end

class Rover

  def initialize coordinates
    coordinates = coordinates.split
    @navigator = Navigator.new(coordinates[0].to_i, coordinates[1].to_i, coordinates[2])
  end

  def explore instructions
    puts "starting exploration at #{@navigator.coordinates}"
    @navigator.move(instructions)
    puts "finished exploration at #{@navigator.coordinates}"
    @navigator.coordinates
  end

end

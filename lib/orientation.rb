class Orientation

  CARDINAL_POINTS = %w(N E S W)

  attr_reader :direction

  def initialize direction
    @direction = direction
    raise ArgumentError, "Invalid direction" unless valid_direction?
  end

  def rotate degree
    new_angle = cardinal_to_angle + degree
    @direction = angle_to_cardinal(new_angle)
  end

  private

  def valid_direction?
    CARDINAL_POINTS.include?(@direction)
  end

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

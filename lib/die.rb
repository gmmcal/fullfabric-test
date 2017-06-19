class Die
  attr_reader :sides

  def initialize(sides)
    raise StandardError.new('Sides should be greater than zero') unless sides > 0

    @sides = sides
  end
end

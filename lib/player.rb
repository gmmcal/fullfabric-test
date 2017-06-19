class Player
  attr_reader :name
  attr_reader :life_points

  def initialize(name, life_points)
    raise StandardError.new('Life points should be greater than zero') if life_points <= 0

    @name = name
    @life_points = life_points
  end

  def attack(die)
    die.roll
  end
end

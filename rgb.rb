class RGB
  attr_accessor :red,:green,:blue
  def initialize(red, green, blue)
    @red = red.to_f
    @green = green.to_f
    @blue = blue.to_f
  end
end

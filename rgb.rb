class Rgb
  attr_accessor :red,:green,:blue
  def initialize(red, green, blue)
    @red = red.to_f
    @green = green.to_f
    @blue = blue.to_f
  end

  def add_color (a_color)
    Rgb.new(@red+a_color.red, @green+a_color.green, @blue+a_color.blue)
  end

  def substract_color (a_color)
    Rgb.new(@red-a_color.red, @green-a_color.green, @blue-a_color.blue)
  end

  def times_color (a_number)
    Rgb.new(@red*a_number, @green*a_number, @blue*a_number,)
  end
end

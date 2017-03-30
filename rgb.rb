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

  def multiply_color (a_color)
    red = @red*a_color.red
    green = @green*a_color.green
    blue = @blue*a_color.blue

    Rgb.new(red,green,blue)
  end

  def times_color (a_number)
    number_as_float = a_number.to_f
    Rgb.new(@red*number_as_float, @green*number_as_float, @blue*number_as_float)
  end

end

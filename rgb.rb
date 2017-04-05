class Rgb
  attr_accessor :red,:green,:blue
  def initialize(red, green, blue)
    @red = red.to_f
    @green = green.to_f
    @blue = blue.to_f
  end

  def add_color (a_color)
    color = [@red+a_color.red, @green+a_color.green, @blue+a_color.blue]
    fix_color(color)
  end

  def substract_color (a_color)
    color = [@red-a_color.red, @green-a_color.green, @blue-a_color.blue]
    fix_color(color)
  end

  def fix_color(rgb)
    (0..rgb.length-1).each do |i|
      if rgb[i]>1.0
        rgb[i] = 1
      end
      if rgb[i]<0.0
        rgb[i] = 0
      end
    end
    return Rgb.new(rgb[0],rgb[1],rgb[2])
  end

  def multiply_color (a_color)
    red = @red*a_color.red
    green = @green*a_color.green
    blue = @blue*a_color.blue

    color = [red,green,blue]
    fix_color(color)

  end

  def times_color (a_number)
    number_as_float = a_number.to_f
    color = [@red*number_as_float, @green*number_as_float, @blue*number_as_float]
    fix_color(color)
  end

end

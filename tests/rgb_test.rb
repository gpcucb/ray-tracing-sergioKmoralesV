require 'minitest/autorun'
require 'minitest/reporters'
require './rgb'

class RGBTest < Minitest::Test
  def setup
    @a_rgb = Rgb.new(255,255,255)
  end

  def test_01_creates_an_object_rgb
  end
end

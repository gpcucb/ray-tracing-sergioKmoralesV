require 'minitest/autorun'
require 'minitest/reporters'
require './rgb'

MiniTest::Reporters.use!

class RGBTest < Minitest::Test
  def setup
    @a_rgb = RGB.new(255,255,255)
  end

  def test_01_creates_an_object_rgb
  end
end

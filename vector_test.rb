require 'minitest/autorun'
require 'minitest/reporters'
require './vector'

MiniTest::Reporters.use!

class VectorTest < Minitest::Test
  def setup
    @a_vector = Vector.new(4,5,8)
  end

  def test_01_creates_an_object_vector_and_saves_values_as_floats
    @a_vector = Vector.new(4,5,8)
    assert_equal("(4.0, 5.0, 8.0)", @a_vector.as_string())
  end
end

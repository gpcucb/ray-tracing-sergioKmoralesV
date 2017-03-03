require 'minitest/autorun'
require 'minitest/reporters'
require './vector'

MiniTest::Reporters.use!

class VectorTest < Minitest::Test
  def setup
    @a_vector = Vector.new(4,5,8)
    @another_vector = Vector.new(5,6,7)
  end

  def test_01_creates_an_object_vector_and_saves_values_as_floats
    @a_vector = Vector.new(4,5,8)
    assert_equal("(4.0, 5.0, 8.0)", @a_vector.as_string())
  end

  def test_02_add_two_vectors_correctly
    result = @a_vector.add_vector(@another_vector)
    assert_equal(@a_vector.x+@another_vector.x, result.x)
    assert_equal(@a_vector.y+@another_vector.y, result.y)
    assert_equal(@a_vector.z+@another_vector.z, result.z)
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
require './vector'

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
  def test_03_substract_two_vectors_correctly
    result = @a_vector.substract_vector(@another_vector)
    assert_equal(@a_vector.x-@another_vector.x, result.x)
    assert_equal(@a_vector.y-@another_vector.y, result.y)
    assert_equal(@a_vector.z-@another_vector.z, result.z)
  end

  def test_04_module_of_a_vector
    x,y,z = 4,5,8
    a_expected_module = Math.sqrt((x**2) + (y**2) + (z**2))
    assert_equal(a_expected_module, @a_vector.module)
  end

  def test_05_cross_product_calculated_correctly
    x1,y1,z1,x2,y2,z2 = @a_vector.x,@a_vector.y,@a_vector.z,@another_vector.x,@another_vector.y,@another_vector.z
    result = @a_vector.cross_product(@another_vector)
    assert_equal(y1*z2 - z1*y2, result.x)
    assert_equal(z1*x2 - x1*z2, result.y)
    assert_equal(x1*y2 - x2*y1, result.z)
  end

  def test_06_dot_product_calculated_correctly
    x1,y1,z1,x2,y2,z2 = @a_vector.x,@a_vector.y,@a_vector.z,@another_vector.x,@another_vector.y,@another_vector.z
    assert_equal(x1*x2+y1*y2+z1*z2,@a_vector.dot_product(@another_vector))
  end

  def test_07_number_product_calculated_correctly
    a_number = 8
    result = @a_vector.number_product(a_number)
    assert_equal(@a_vector.x * a_number,result.x)
    assert_equal(@a_vector.y * a_number,result.y)
    assert_equal(@a_vector.z * a_number,result.z)
  end
end

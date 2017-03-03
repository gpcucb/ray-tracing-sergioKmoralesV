class Vector
  attr_accessor :x,:y,:z
  def initialize (x,y,z)
    @x,@y,@z = x.to_f,y.to_f,z.to_f
  end
  def as_string
    "(#{@x}, #{@y}, #{@z})"
  end
  def add_vector another_vector
    Vector.new(@x+another_vector.x , @y+another_vector.y, @z+another_vector.z)
  end
end

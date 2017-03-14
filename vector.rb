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

  def substract_vector another_vector
    Vector.new(@x-another_vector.x , @y-another_vector.y, @z-another_vector.z)
  end

  def module
    Math.sqrt((@x**2) + (@y**2) + (@z**2))
  end

  #Producto vectorial
  def cross_product another_vector
    i = (@y * another_vector.z) - (@z * another_vector.y)
    j = (@z * another_vector.x) - (@x * another_vector.z)
    k = (@x * another_vector.y) - (@y * another_vector.x)
    Vector.new(i,j,k)
  end

  #Producto escalar
  def dot_product another_vector
    ((@x * another_vector.x) + (@y * another_vector.y) + (@z * another_vector.z)).to_f
  end

  #X * vector
  def number_product a_number
    Vector.new(@x*a_number, @y*a_number, @z*a_number)
  end
  
  def show
    puts as_string
  end
end

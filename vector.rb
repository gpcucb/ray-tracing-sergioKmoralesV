class Vector
  def initialize (x,y,z)
    @x,@y,@z = x.to_f,y.to_f,z.to_f
  end
  def as_string
    "(#{@x}, #{@y}, #{@z})"
  end
end

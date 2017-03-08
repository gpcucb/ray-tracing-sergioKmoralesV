class Camera
  attr_accessor :eye, :center, :up
  def initialize(eye, center, up)
    @eye = eye
    @center = center
    @up = up
  end

  def vector_w()
    x = @e.x/@e.module
    y = @e.y/@e.module
    z = @e.z/@e.module
    Vector.new(x, y, z)
  end
end

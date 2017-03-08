class Camera
  attr_accessor :eye, :center, :up
  def initialize(eye, center, up)
    @eye = eye
    @center = center
    @up = up
  end

  def calculate_w_vector
    x = @e.x/@e.module
    y = @e.y/@e.module
    z = @e.z/@e.module
    Vector.new(x, y, z)
  end

  def calculate_u_vector a_w_vector
    a_product = @up.cross_product(a_w_vector)
    x = a_product.x / a_product.module
    y = a_product.y / a_product.module
    z = a_product.z / a_product.module
    Vector.new(x, y, z)
  end

  def calculate_v_vector (a_w_vector,a_u_vector)
    a_w_vector.cross_product(a_u_vector)
  end
end

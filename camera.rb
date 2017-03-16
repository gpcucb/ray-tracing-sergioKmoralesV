require_relative 'vector.rb'
class Camera
  attr_accessor :eye, :center, :up, :fov, :df
  def initialize(eye, center, up, fov ,df)
    @eye = eye
    @center = center
    @up = up
    @fov = ((fov * Math::PI)/180).to_f#why? convert degrees to radians
    @df = df.to_f #escalar
  end

  def calculate_w_vector
    distance = @center.substract_vector(@eye)
    x = distance.x/distance.module
    y = distance.y/distance.module
    z = distance.z/distance.module
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

  def ray_direction(i,j,nx,ny)
    t = @df * Math::tan(@fov/2).to_f
    b = -t
    r = (((nx * t) / ny)).to_f
    l = -r

    u = l + ((r - l) * (i + 0.5))/nx
    v = b + ((t - b) * (j + 0.5))/ny

    dw = calculate_w_vector.number_product(-@df)
    uu = (calculate_u_vector(calculate_w_vector)).number_product(u)
    vv = (calculate_v_vector(calculate_w_vector,calculate_u_vector(calculate_w_vector))).number_product(v)

    return dw.add_vector(uu.add_vector(vv))
  end
end

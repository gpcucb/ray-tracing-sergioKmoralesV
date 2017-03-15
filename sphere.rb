class Sphere
  attr_accessor :position, :radius
  def initialize(position, radius)
    @position = position
    @radius = radius
  end

  def intersection? (ray)
    d = ray.position
    e = ray.direction

    a = d.dot_product(d)
    e_c =  e.substract_vector(@position)
    b = (d.number_product(2)).dot_product(e_c)
    c = e_c.dot_product(e_c) - @radius*@radius

    puts "(A:#{a} B:#{b} C:#{c})"
  end

end

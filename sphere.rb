class Sphere
  attr_accessor :position, :radius
  def initialize(position, radius)
    @position = position
    @radius = radius.to_f
  end

  def intersection? (ray)
    e = ray.position
    d = ray.direction

    a = d.dot_product(d)
    e_c =  e.substract_vector(@position)
    b = d.number_product(2).dot_product(e_c)
    c = e_c.dot_product(e_c) - @radius ** 2

    puts "(A:#{a} B:#{b} C:#{c})"
  end

end

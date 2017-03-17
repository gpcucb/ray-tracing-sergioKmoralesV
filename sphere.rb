require_relative 'intersection.rb'

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
    dd = d.number_product(2)
    b = dd.dot_product(e_c)
    c = e_c.dot_product(e_c) - @radius ** 2

    discriminant = b**2 - 4*a*c

    return Intersection.unsuccessful if (discriminant < 0.0)

    puts "(A:#{a} B:#{b} C:#{c})"

    t0 = ((b * -1) - Math.sqrt(discriminant))/(2*a)
    t1 = ((b * -1) + Math.sqrt(discriminant))/(2*a)

    
  end

end

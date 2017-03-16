class Triangle
  attr_accessor :a, :b, :c
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end
  def intersection? (ray)
    e_ray = ray.position
    d_ray = ray.direction

    a = @a.x - @b.x
    b = @a.y - @b.y
    c = @a.z - @b.z
    d = @a.x - @c.x
    e = @a.y - @c.y
    f = @a.z - @c.z
    g = d_ray.x
    h = d_ray.y
    i = d_ray.y

    j = @a.x - e_ray.x
    k = @a.y - e_ray.y
    l = @a.z - e_ray.z

    m_cap = a*(e*i - h*f) + b*(g*f - d*i) + c*(d*h - e*g)

    beta = (j*(e*i - h*f) + k*(g*f - d*i) + l*(d*h - e*g))/m_cap
    gama = (i*(a*k - j*b) + h*(j*c - a*l) + g*(b*l - k*c))/m_cap
    t = -1 * ((f*(a*k - j*b) + e*(j*c - a*l) + d*(b*l - k*c))/m_cap)

    puts "(Beta: #{beta} | Gama: #{gama} | t: #{t})"
  end
end

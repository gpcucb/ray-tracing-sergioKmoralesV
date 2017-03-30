require_relative 'renderer.rb'
require_relative 'camera.rb'
require_relative 'vector.rb'
require_relative 'rgb.rb'
require_relative 'intersection.rb'
require_relative 'triangle.rb'
require_relative 'material.rb'
require_relative 'light.rb'



class RayTracer < Renderer

  attr_accessor :camera

  def initialize(width, height)
    super(width, height, 250.0, 250.0, 250.0)

    @nx = @width
    @ny = @height
    # Cámara
    e= Vector.new(278,273,-800)
    center= Vector.new(278,273,-500)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    #Some colors
    fucsia = Rgb.new(1.0,0.2,0.4)
    red = Rgb.new(1.0,0.0,0.0)
    yellow = Rgb.new(1,1,0)


    #Material values
    specular = Rgb.new(1,1,1)
    power = 60
    reflection = 0.5

    # Valores de la esfera
    position = Vector.new(370,120,370)
    radius = 120

    # Valores del triángulo
    a = Vector.new(552.0,8.0,0.0)
    b = Vector.new(0.0,0.0,0.0)
    c = Vector.new(0.0,0.0,560.0)

    # Light Values
    light_color = Rgb.new(0.8,0.6,0.7)
    puts "#{light_color.red} #{light_color.green} #{light_color.blue}"
    light_position = Vector.new(0.0, 0.0, 200.0)
    @light = Light.new(light_position,light_color)

    @sphere = Sphere.new(position, radius, Material.new(yellow,specular,power,reflection))
    @triangle = Triangle.new(a, b, c, Material.new(red,specular,power,reflection))
    @objects=[]
    @objects << @sphere
    #@objects << @triangle
  end

  def max(a_number,another_number)
    if a_number > another_number
      return a_number
    else
      return another_number
    end
  end

  def calculate_lambertian_shading (intersection_point, intersection_normal, ray, light, object)
    n = intersection_normal.normalize
    l = light.position.substract_vector(intersection_point).normalize

    nl = n.dot_product(l)
    max = max(0,nl)
    kd = object.material.diffuse
    kdI = kd.multiply_color(light.color)
    return kdI.times_color(max)
  end

  def calculate_pixel(i, j)
    #degradado
    #color = Rgb.new( 1.0, i.to_f/@nx, j.to_f/@ny)
    #{red: color.red, green: color.green, blue: color.blue}

    e = @camera.eye
    dir = @camera.ray_direction(i,j,@nx,@ny)
    ray = Ray.new(e, dir)
    t = Float::INFINITY

    @obj_int = nil
    @objects.each do |obj|
      intersection = obj.intersection?(ray, t)
      if intersection.successful?
        @obj_int = obj
        t = intersection.t
      end
    end
    if @obj_int==nil
      color = Rgb.new(0.0,0.0,0.0)
    else
      intersection_point = ray.position.add_vector(ray.direction.number_product(t)) #ray definition
      intersection_normal = @obj_int.normal(intersection_point)

      lambert = calculate_lambertian_shading(intersection_point,intersection_normal,ray,@light,@obj_int)
      #color =  @obj_int.material.diffuse #2D
      puts "lambert r:#{lambert.red*255} g:#{lambert.green*255} b:#{lambert.blue*255}"
      color = lambert #shade lambert
    end

    return {red: color.red, green: color.green, blue: color.blue}
  end
end

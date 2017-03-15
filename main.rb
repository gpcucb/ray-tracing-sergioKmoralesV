require_relative 'vector.rb'
require_relative 'camera.rb'
require_relative 'ray.rb'
require_relative 'sphere.rb'

vector1 = Vector.new(1,2,3)
vector2 = Vector.new(45,78,23)


#Valores esfera
position = Vector.new(370,120,370)
radius = 120

# Valores de la cámara
e= Vector.new(278,273,-800)
center= Vector.new(278,273,-700)
up= Vector.new(0,1,0)
fov= 39.31
df=0.035

nx = 640.0
ny = 480.0



camera = Camera.new(e,center,up,fov,df)
sphere = Sphere.new(position,radius)

(0...nx).each do |i|
  (0...ny).each do |j|
    dir = camera.calculate_ray_direction(i,j,nx,ny)
    ray = Ray.new(e,dir)
    sphere.intersection?(ray)
  end
end

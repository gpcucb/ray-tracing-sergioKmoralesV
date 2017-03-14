require_relative 'vector.rb'
require_relative 'camera.rb'
vector1 = Vector.new(1,2,3)
vector2 = Vector.new(45,78,23)


e = Vector.new(1,2,-6)
center = Vector.new(1,2,-4)
up = Vector.new(0,1,0)
fov = 39.0
df = 1.0
nx = 640.0
ny = 480.0

camera = Camera.new(e,center,up,fov,df)
(0...nx).each do |i|
  (0...ny).each do |j|
    dir = camera.ray_direction(i,j,nx,ny)
    dir.show
  end
end

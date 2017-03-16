require 'rubygems'
require_relative 'vector.rb'
require_relative 'camera.rb'
require_relative 'ray.rb'
require_relative 'triangle.rb'

# Valores de la cámara
e= Vector.new(278,273,-800)
center= Vector.new(278,273,-700)
up= Vector.new(0,1,0)
fov= 39.31
df= 0.035

nx = 640.0
ny = 480.0

# Valores del triángulo
a = Vector.new(552.0,8,0.0)
b = Vector.new(0.0,0.0,0.0)
c = Vector.new(0.0,0.0,560.0)

camera = Camera.new(e, center, up, fov, df)
triangle = Triangle.new(a, b, c)

(0...nx).each do |i|
  (0...ny).each do |j|
    dir = camera.ray_direction(i,j,nx,ny)
    ray = Ray.new(e, dir)
    triangle.intersection?(ray)
  end
end

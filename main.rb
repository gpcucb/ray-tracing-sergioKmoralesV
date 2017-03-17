require 'rubygems'
require_relative 'vector.rb'
require_relative 'camera.rb'
require_relative 'ray_tracer.rb'
require_relative 'ray.rb'
require_relative 'sphere.rb'

renderer = RayTracer.new(640.0, 480.0)
renderer.render('Raytracing', 'raytracing.png')

class Material
  attr_accessor :diffuse, :specular, :power, :reflection
  def initialize(diffuse, specular, power, reflection)
    @diffuse = diffuse
    @specular = specular
    @power = power
    @reflection = reflection
  end
end

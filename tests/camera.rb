class Camera
  attr_accessor :eye, :center, :up
  def initialize(eye, center, up)
    @eye = eye
    @center = center
    @up = up
  end
  
end

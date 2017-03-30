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
    e= Vector.new(0,0,-400)
    center= Vector.new(0,0,0)
    up= Vector.new(0,1,0)
    fov= 39.31
    df=0.035
    @camera = Camera.new(e, center, up, fov, df)

    #Some colors
    fucsia = Rgb.new(1.0,0.2,0.4)
    red = Rgb.new(1.0,0.0,0.0)
    dark_red = Rgb.new(0.76,0.098,0.129)
    yellow = Rgb.new(1,1,0)
    water_color = Rgb.new(0.0588,0.59,1)
    white = Rgb.new(0.63,0.63,0.71)
    blue = Rgb.new(0.031,0.173,0.369)

    #Material values
    specular = Rgb.new(1,1,1)
    power = 60
    reflection = 0.5

    # Light Values
    light_color = Rgb.new(1,1,1)
    light_position = Vector.new(0.0, 100.0, -100.0)
    @light = Light.new(light_position,light_color)

    # Pool values
    a_tri_1 = Vector.new(-200,-40,400)
    b_tri_1 = Vector.new(200,-40,400)
    c_tri_1 = Vector.new(400,400,-200)
    @pool_triangle_1 = Triangle.new(a_tri_1,b_tri_1,c_tri_1,Material.new(water_color,specular,power,reflection))
    a_tri_1 = Vector.new(400,400,-200)
    b_tri_1 = Vector.new(-400,400,-200)
    c_tri_1 = Vector.new(-200,-40,400)
    @pool_triangle_2 = Triangle.new(a_tri_1,b_tri_1,c_tri_1,Material.new(water_color,specular,power,reflection))

    #Bouys{
      buoy_radio = 10
      position_1 = Vector.new(-150,-35,400)
      position_2 = Vector.new(-50,-35,400)
      position_3 = Vector.new(50,-35,400)
      position_4 = Vector.new(150,-35,400)
      position_1_w = Vector.new(-151,-32,395)
      position_2_w = Vector.new(-51,-32,395)
      position_3_w = Vector.new(51,-32,395)
      position_4_w = Vector.new(151,-32,395)


      @buoy_1 = Sphere.new(position_1,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_2 = Sphere.new(position_2,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_3 = Sphere.new(position_3,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_4 = Sphere.new(position_4,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_1_w = Sphere.new(position_1_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_2_w = Sphere.new(position_2_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_3_w = Sphere.new(position_3_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_4_w = Sphere.new(position_4_w,buoy_radio,Material.new(dark_red,specular,power,reflection))

#-------------------------------------------------------
      position_11 = Vector.new(-155,-20,380)
      position_12 = Vector.new(-55,-20,380)
      position_13 = Vector.new(55,-20,380)
      position_14 = Vector.new(155,-20,380)
      position_11_w = Vector.new(-156,-17,375)
      position_12_w = Vector.new(-56,-17,375)
      position_13_w = Vector.new(56,-17,375)
      position_14_w = Vector.new(156,-17,375)

      @buoy_11 = Sphere.new(position_11,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_12 = Sphere.new(position_12,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_13 = Sphere.new(position_13,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_14 = Sphere.new(position_14,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_11_w = Sphere.new(position_11_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_12_w = Sphere.new(position_12_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_13_w = Sphere.new(position_13_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_14_w = Sphere.new(position_14_w,buoy_radio,Material.new(dark_red,specular,power,reflection))


#-------------------------------------------------------
      position_21 = Vector.new(-160,-5,360)
      position_22 = Vector.new(-60,-5,360)
      position_23 = Vector.new(60,-5,360)
      position_24 = Vector.new(160,-5,360)
      position_21_w = Vector.new(-161,-2,355)
      position_22_w = Vector.new(-61,-2,355)
      position_23_w = Vector.new(61,-2,355)
      position_24_w = Vector.new(161,-2,355)

      @buoy_21 = Sphere.new(position_21,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_22 = Sphere.new(position_22,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_23 = Sphere.new(position_23,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_24 = Sphere.new(position_24,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_21_w = Sphere.new(position_21_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_22_w = Sphere.new(position_22_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_23_w = Sphere.new(position_23_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_24_w = Sphere.new(position_24_w,buoy_radio,Material.new(dark_red,specular,power,reflection))

#-------------------------------------------------------
      position_31 = Vector.new(-165,10,340)
      position_32 = Vector.new(-65,10,340)
      position_33 = Vector.new(65,10,340)
      position_34 = Vector.new(165,10,340)
      position_31_w = Vector.new(-166,13,335)
      position_32_w = Vector.new(-66,13,335)
      position_33_w = Vector.new(66,13,335)
      position_34_w = Vector.new(166,13,335)

      @buoy_31 = Sphere.new(position_31,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_32 = Sphere.new(position_32,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_33 = Sphere.new(position_33,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_34 = Sphere.new(position_34,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_31_w = Sphere.new(position_31_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_32_w = Sphere.new(position_32_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_33_w = Sphere.new(position_33_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_34_w = Sphere.new(position_34_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_41 = Vector.new(-170,25,320)
      position_42 = Vector.new(-70,25,320)
      position_43 = Vector.new(70,25,320)
      position_44 = Vector.new(170,25,320)
      position_41_w = Vector.new(-171,28,315)
      position_42_w = Vector.new(-71,28,315)
      position_43_w = Vector.new(71,28,315)
      position_44_w = Vector.new(171,28,315)

      @buoy_41 = Sphere.new(position_41,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_42 = Sphere.new(position_42,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_43 = Sphere.new(position_43,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_44 = Sphere.new(position_44,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_41_w = Sphere.new(position_41_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_42_w = Sphere.new(position_42_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_43_w = Sphere.new(position_43_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_44_w = Sphere.new(position_44_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_51 = Vector.new(-175,40,300)
      position_52 = Vector.new(-75,40,300)
      position_53 = Vector.new(75,40,300)
      position_54 = Vector.new(175,40,300)
      position_51_w = Vector.new(-176,43,295)
      position_52_w = Vector.new(-76,43,295)
      position_53_w = Vector.new(76,43,295)
      position_54_w = Vector.new(176,43,295)

      @buoy_51 = Sphere.new(position_51,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_52 = Sphere.new(position_52,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_53 = Sphere.new(position_53,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_54 = Sphere.new(position_54,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_51_w = Sphere.new(position_51_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_52_w = Sphere.new(position_52_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_53_w = Sphere.new(position_53_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_54_w = Sphere.new(position_54_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_61 = Vector.new(-180,55,280)
      position_62 = Vector.new(-80,55,280)
      position_63 = Vector.new(80,55,280)
      position_64 = Vector.new(180,55,280)
      position_61_w = Vector.new(-181,58,275)
      position_62_w = Vector.new(-81,58,275)
      position_63_w = Vector.new(81,58,275)
      position_64_w = Vector.new(181,58,275)

      @buoy_61 = Sphere.new(position_61,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_62 = Sphere.new(position_62,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_63 = Sphere.new(position_63,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_64 = Sphere.new(position_64,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_61_w = Sphere.new(position_61_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_62_w = Sphere.new(position_62_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_63_w = Sphere.new(position_63_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_64_w = Sphere.new(position_64_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_71 = Vector.new(-185,70,260)
      position_72 = Vector.new(-85,70,260)
      position_73 = Vector.new(85,70,260)
      position_74 = Vector.new(185,70,260)
      position_71_w = Vector.new(-186,73,255)
      position_72_w = Vector.new(-86,73,255)
      position_73_w = Vector.new(86,73,255)
      position_74_w = Vector.new(186,73,255)

      @buoy_71 = Sphere.new(position_71,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_72 = Sphere.new(position_72,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_73 = Sphere.new(position_73,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_74 = Sphere.new(position_74,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_71_w = Sphere.new(position_71_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_72_w = Sphere.new(position_72_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_73_w = Sphere.new(position_73_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_74_w = Sphere.new(position_74_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_81 = Vector.new(-190,85,240)
      position_82 = Vector.new(-90,85,240)
      position_83 = Vector.new(90,85,240)
      position_84 = Vector.new(190,85,240)
      position_81_w = Vector.new(-191,88,235)
      position_82_w = Vector.new(-91,88,235)
      position_83_w = Vector.new(91,88,235)
      position_84_w = Vector.new(191,88,235)

      @buoy_81 = Sphere.new(position_81,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_82 = Sphere.new(position_82,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_83 = Sphere.new(position_83,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_84 = Sphere.new(position_84,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_81_w = Sphere.new(position_81_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_82_w = Sphere.new(position_82_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_83_w = Sphere.new(position_83_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_84_w = Sphere.new(position_84_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_91 = Vector.new(-195,100,220)
      position_92 = Vector.new(-95,100,220)
      position_93 = Vector.new(95,100,220)
      position_94 = Vector.new(195,100,220)
      position_91_w = Vector.new(-196,103,215)
      position_92_w = Vector.new(-96,103,215)
      position_93_w = Vector.new(96,103,215)
      position_94_w = Vector.new(196,103,215)

      @buoy_91 = Sphere.new(position_91,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_92 = Sphere.new(position_92,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_93 = Sphere.new(position_93,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_94 = Sphere.new(position_94,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_91_w = Sphere.new(position_91_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_92_w = Sphere.new(position_92_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_93_w = Sphere.new(position_93_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_94_w = Sphere.new(position_94_w,buoy_radio,Material.new(blue,specular,power,reflection))


#-------------------------------------------------------
      position_101 = Vector.new(-200,115,200)
      position_102 = Vector.new(-100,115,200)
      position_103 = Vector.new(100,115,200)
      position_104 = Vector.new(200,115,200)
      position_101_w = Vector.new(-201,118,195)
      position_102_w = Vector.new(-101,118,195)
      position_103_w = Vector.new(101,118,195)
      position_104_w = Vector.new(201,118,195)

      @buoy_101 = Sphere.new(position_101,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_102 = Sphere.new(position_102,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_103 = Sphere.new(position_103,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_104 = Sphere.new(position_104,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_101_w = Sphere.new(position_101_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_102_w = Sphere.new(position_102_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_103_w = Sphere.new(position_103_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_104_w = Sphere.new(position_104_w,buoy_radio,Material.new(blue,specular,power,reflection))

#-------------------------------------------------------
      position_111 = Vector.new(-205,130,180)
      position_112 = Vector.new(-105,130,180)
      position_113 = Vector.new(105,130,180)
      position_114 = Vector.new(205,130,180)
      position_111_w = Vector.new(-206,133,175)
      position_112_w = Vector.new(-106,133,175)
      position_113_w = Vector.new(106,133,175)
      position_114_w = Vector.new(206,133,175)

      @buoy_111 = Sphere.new(position_111,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_112 = Sphere.new(position_112,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_113 = Sphere.new(position_113,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_114 = Sphere.new(position_114,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_111_w = Sphere.new(position_111_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_112_w = Sphere.new(position_112_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_113_w = Sphere.new(position_113_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_114_w = Sphere.new(position_114_w,buoy_radio,Material.new(blue,specular,power,reflection))



#-------------------------------------------------------
      position_121 = Vector.new(-210,145,160)
      position_122 = Vector.new(-110,145,160)
      position_123 = Vector.new(110,145,160)
      position_124 = Vector.new(210,145,160)
      position_121_w = Vector.new(-211,148,155)
      position_122_w = Vector.new(-111,148,155)
      position_123_w = Vector.new(111,148,155)
      position_124_w = Vector.new(211,148,155)

      @buoy_121 = Sphere.new(position_121,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_122 = Sphere.new(position_122,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_123 = Sphere.new(position_123,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_124 = Sphere.new(position_124,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_121_w = Sphere.new(position_121_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_122_w = Sphere.new(position_122_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_123_w = Sphere.new(position_123_w,buoy_radio,Material.new(blue,specular,power,reflection))
      @buoy_124_w = Sphere.new(position_124_w,buoy_radio,Material.new(blue,specular,power,reflection))



#-------------------------------------------------------
      position_131 = Vector.new(-215,160,140)
      position_132 = Vector.new(-115,160,140)
      position_133 = Vector.new(115,160,140)
      position_134 = Vector.new(215,160,140)
      position_131_w = Vector.new(-216,163,135)
      position_132_w = Vector.new(-116,163,135)
      position_133_w = Vector.new(116,163,135)
      position_134_w = Vector.new(216,163,135)

      @buoy_131 = Sphere.new(position_131,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_132 = Sphere.new(position_132,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_133 = Sphere.new(position_133,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_134 = Sphere.new(position_134,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_131_w = Sphere.new(position_131_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_132_w = Sphere.new(position_132_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_133_w = Sphere.new(position_133_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_134_w = Sphere.new(position_134_w,buoy_radio,Material.new(dark_red,specular,power,reflection))




#-------------------------------------------------------
      position_141 = Vector.new(-220,175,120)
      position_142 = Vector.new(-120,175,120)
      position_143 = Vector.new(120,175,120)
      position_144 = Vector.new(220,175,120)
      position_141_w = Vector.new(-221,178,115)
      position_142_w = Vector.new(-121,178,115)
      position_143_w = Vector.new(121,178,115)
      position_144_w = Vector.new(221,178,115)

      @buoy_141 = Sphere.new(position_141,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_142 = Sphere.new(position_142,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_143 = Sphere.new(position_143,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_144 = Sphere.new(position_144,buoy_radio,Material.new(white,specular,power,reflection))
      @buoy_141_w = Sphere.new(position_141_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_142_w = Sphere.new(position_142_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_143_w = Sphere.new(position_143_w,buoy_radio,Material.new(dark_red,specular,power,reflection))
      @buoy_144_w = Sphere.new(position_144_w,buoy_radio,Material.new(dark_red,specular,power,reflection))

    #}
    @objects = []
    @objects << @pool_triangle_1 << @pool_triangle_2
    @objects << @buoy_1 << @buoy_2 << @buoy_3 << @buoy_4
    @objects << @buoy_1_w << @buoy_2_w << @buoy_3_w << @buoy_4_w

    @objects << @buoy_11<< @buoy_12<< @buoy_13<< @buoy_14
    @objects << @buoy_11_w << @buoy_12_w << @buoy_13_w << @buoy_14_w

    @objects << @buoy_21<< @buoy_22<< @buoy_23<< @buoy_24
    @objects << @buoy_21_w << @buoy_22_w << @buoy_23_w << @buoy_24_w

    @objects << @buoy_31<< @buoy_32<< @buoy_33<< @buoy_34
    @objects << @buoy_31_w << @buoy_32_w << @buoy_33_w << @buoy_34_w

    @objects << @buoy_41<< @buoy_42<< @buoy_43<< @buoy_44
    @objects << @buoy_41_w << @buoy_42_w << @buoy_43_w << @buoy_44_w

    @objects << @buoy_51<< @buoy_52<< @buoy_53<< @buoy_54
    @objects << @buoy_51_w << @buoy_52_w << @buoy_53_w << @buoy_54_w

    @objects << @buoy_61<< @buoy_62<< @buoy_63<< @buoy_64
    @objects << @buoy_61_w << @buoy_62_w << @buoy_63_w << @buoy_64_w

    @objects << @buoy_71<< @buoy_72<< @buoy_73<< @buoy_74
    @objects << @buoy_71_w << @buoy_72_w << @buoy_73_w << @buoy_74_w

    @objects << @buoy_81<< @buoy_82<< @buoy_83<< @buoy_84
    @objects << @buoy_81_w << @buoy_82_w << @buoy_83_w << @buoy_84_w
    @objects << @buoy_91<< @buoy_92<< @buoy_93<< @buoy_94
    @objects << @buoy_91_w << @buoy_92_w << @buoy_93_w << @buoy_94_w
    @objects << @buoy_101<< @buoy_102<< @buoy_103<< @buoy_104
    @objects << @buoy_101_w << @buoy_102_w << @buoy_103_w << @buoy_104_w
    @objects << @buoy_111<< @buoy_112<< @buoy_113<< @buoy_114
    @objects << @buoy_111_w << @buoy_112_w << @buoy_113_w << @buoy_114_w
    @objects << @buoy_121<< @buoy_122<< @buoy_123<< @buoy_124
    @objects << @buoy_121_w << @buoy_122_w << @buoy_123_w << @buoy_124_w
    @objects << @buoy_131<< @buoy_132<< @buoy_133<< @buoy_134
    @objects << @buoy_131_w << @buoy_132_w << @buoy_133_w << @buoy_134_w
    @objects << @buoy_141<< @buoy_142<< @buoy_143<< @buoy_144
    @objects << @buoy_141_w << @buoy_142_w << @buoy_143_w << @buoy_144_w

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

  def calculate_blinn_phong_shading(intersection_point, intersection_normal, ray, light, object)
    n = intersection_normal.normalize
    v = ray.position.substract_vector(intersection_point).normalize
    l = light.position.substract_vector(intersection_point).normalize
    h = v.add_vector(l).normalize

    nh = n.dot_product(h)
    ks = object.material.specular
    p = object.material.power
    max = max(0,nh)
    ksI = ks.multiply_color(light.color)

    return ksI.times_color(max**p)

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
      blinn_phong = calculate_blinn_phong_shading(intersection_point,intersection_normal,ray,@light, @obj_int)
      puts "lambert r:#{lambert.red} g:#{lambert.green} b:#{lambert.blue}"
      #color =  @obj_int.material.diffuse #2D
      #color = lambert #shade lambert
      #color = lambert.add_color(blinn_phong) #3D Phong

      #Ambient values
      ka = @obj_int.material.diffuse
      @ambient_light = Rgb.new(0.15,0.15,0.15)

      color = lambert.add_color(blinn_phong).add_color(@ambient_light.multiply_color(ka))
    end

    return {red: color.red, green: color.green, blue: color.blue}
  end
end

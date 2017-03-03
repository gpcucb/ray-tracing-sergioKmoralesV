require_relative 'vector'

@vector_1 = Vector.new(35,36,-5)
@vector_2 = Vector.new(8,-10,4)

@vector_1.show()
@vector_2.show()

add_vectors_result = @vector_1.add_vector(@vector_2)
puts 'ADD'
add_vectors_result.show()

substract_vectors_result = @vector_1.substract_vector(@vector_2)
puts 'SUBSTRACT'
substract_vectors_result.show()

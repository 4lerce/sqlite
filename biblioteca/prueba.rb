# prueba.rb

# require_relative 'lib/usuario'

require_relative 'lib/libro'

# -- Crear un nuevo libro --
# libro = Libro.new(titulo: "Las aventuras de Alicia en el país de las maravillas", autor: "Lewis Carroll")
# libro.guardar
# puts "Libro creado con ID: #{libro.id}"

# -- Buscar un libro por ID --
libro_encontrado = Libro.buscar(5)
# libro_encontrado = Libro.buscar(libro.id)
if libro_encontrado
  puts "Libro encontrado: #{libro_encontrado.titulo} de #{libro_encontrado.autor}"
else
  puts "Libro no encontrado"
end

# # -- Modificar los datos del libro --
# libro_encontrado.titulo = "Sobre héroes y tumbas"
# libro_encontrado.guardar
# puts "Libro actualizado"

# -- Ver todos los libros --
puts "\nListado de todos los libros:"
Libro.todos.each do |l|
  puts "ID: #{l.id} | Título: #{l.titulo} | Autor: #{l.autor}"
end


# -- Buscar y Actualizar datos de usuario --
# usuario = Usuario.buscar(10)

# if usuario
#   puts "Antes de la actualización:"
#   puts "Nombre: #{usuario.nombre}"
#   puts "Correo: #{usuario.correo}"

#   usuario.nombre = "Victor Volcano"
#   usuario.correo = "victor@mail.org"

#   usuario.guardar
  
#   puts "\nDespués de la actualización:"
#   actualizado = Usuario.buscar(10)
#   puts "Nombre: #{actualizado.nombre}"
#   puts "Correo: #{actualizado.correo}"
# else
#   puts "Usuario con ID 10 no encontrado."
# end

# # -- Crear un nuevo usuario --
# usuario = Usuario.new(nombre: "Victor Volcan", correo: "victor@mail.cl")
# usuario.guardar
# puts "Nuevo usuario creado con ID: #{usuario.id}"

# -- Mostrar todos los usuarios --
# usuarios = Usuario.todos
# puts "Usuarios en la base de datos:"
# usuarios.each { |u| puts "ID: #{u.id}, Nombre: #{u.nombre}, Correo: #{u.correo}"}

# # -- Buscar un usuario por ID --
# usuario_encontrado = Usuario.buscar(5)
# if usuario_encontrado
#   puts "Usuario encontrado: #{usuario_encontrado.nombre}"
# else
#   puts "Usuario no encontrado."
# end
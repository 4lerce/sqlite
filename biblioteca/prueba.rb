# prueba.rb

require_relative 'lib/usuario'
require_relative 'lib/libro'
require_relative 'lib/prestamo'

# --- TESTING 'lib/prestamo.rb' ---

# -- Crear un nuevo préstamo --
puts "Creando un nuevo préstamo..."
prestamo = Prestamo.new(id_usuario: 1, id_libro: 2, fecha_prestamo: "2025-05-03")
prestamo.guardar
puts "Préstamo creado con ID #{prestamo.id}"

# -- Listar todos los préstamos --
puts "\nLista de todos los préstamos:"
Prestamo.todos.each do |p|
  puts "ID: #{p.id}, Usuario: #{p.id_usuario}, Libro: #{p.id_libro}, Fecha: #{p.fecha_prestamo}"
end

# -- Buscar un préstamo específico --
puts "\nBuscando préstamo con ID 1:"
encontrado = Prestamo.buscar(1)
if encontrado
  puts "Préstamo encontrado: Usuario #{encontrado.id_usuario}, Libro #{encontrado.id_libro}, Fecha #{encontrado.fecha_prestamo}"
else
  puts "No se encontró un préstamo con ID 1"
end

# --- TESTING 'lib/libro.rb' ---

# -- Crear un nuevo libro --
# libro = Libro.new(titulo: "Las aventuras de Alicia en el país de las maravillas", autor: "Lewis Carroll")
# libro.guardar
# puts "Libro creado con ID: #{libro.id}"

# -- Buscar un libro por ID --
# libro_encontrado = Libro.buscar(libro.id)
# if libro_encontrado
#   puts "Libro encontrado: #{libro_encontrado.titulo} de #{libro_encontrado.autor}"
# else
#   puts "Libro no encontrado"
# end

# # -- Modificar los datos del libro --
# libro_encontrado.titulo = "Sobre héroes y tumbas"
# libro_encontrado.guardar
# puts "Libro actualizado"

# -- Ver todos los libros --
# puts "\nListado de todos los libros:"
# Libro.todos.each do |l|
#   puts "ID: #{l.id} | Título: #{l.titulo} | Autor: #{l.autor}"
# end

# --- TESTING 'lib/usuario.rb' ---

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
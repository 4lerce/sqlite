# prueba.rb

require_relative 'lib/usuario'

# -- Crear un nuevo usuario --
usuario = Usuario.new(nombre: "Mercedes Floral", correo: "mercedes@mail.cl")
usuario.guardar
puts "Nuevo usuario creado con ID: #{usuario.id}"

# -- Mostrar todos los usuarios --
usuarios = Usuario.todos
puts "Usuarios en la base de datos:"
usuarios.each { |u| puts "ID: #{u.id}, Nombre: #{u.nombre}, Correo: #{u.correo}"}

# -- Buscar un usuario por ID --
usuario_encontrado = Usuario.buscar(5)
if usuario_encontrado
  puts "Usuario encontrado: #{usuario_encontrado.nombre}"
else
  puts "Usuario no encontrado."
end
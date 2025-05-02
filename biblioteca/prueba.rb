require_relative 'lib/usuario'

# --- Registrar usuario ---
puts "Ingrese nombre:"
nombre = gets.chomp

puts "Ingrese correo:"
correo = gets.chomp

id = Usuario.crear(nombre, correo)
puts "Usuario creado con ID: #{id}"

# --- Buscar usuarios en específico ---
# puts "Ingrese el ID del usuario que desea buscar:"
# id = gets.chomp.to_i

# usuario = Usuario.buscar(id)

# if usuario
#   puts "ID: #{usuario['id_usuario']}"
#   puts "Nombre: #{usuario['nombre']}"
#   puts "Correo: #{usuario['correo']}"
# else
#   puts "No se encontró ningún usuario con ese ID."
# end

# --- Listar todos los usuarios ---
# usuarios = Usuario.todos
# usuarios.each do |usuario|
#   puts "ID: #{usuario['id_usuario']} - Nombre: #{usuario['nombre']} - Correo #{usuario['correo']}"
# end
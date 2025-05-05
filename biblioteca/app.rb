# app.rb

require_relative 'lib/usuario'
require_relative 'lib/libro'
require_relative 'lib/prestamo'

# --- MENÚ PRINCIPAL ---

def menu_principal
  loop do
    puts "\n=== Biblioteca ==="
    puts "1. Usuarios"
    puts "2. Libros"
    puts "3. Préstamos"
    puts "0. Salir"
    print "Seleccione una opción: "
    opcion = gets.chomp

    case opcion
    when "1"
      menu_usuarios
    when "2"
      menu_libros
    when "3"
      menu_prestamos
    when "0"
      puts "¡Hasta luego!"
      break
    else
      puts "Opción no válida."
    end
  end
end

# -- MENÚ USUARIOS --

def menu_usuarios
  loop do
    puts "\n--- Usuarios ---"
    puts "1. Listar todos"
    puts "2. Crear nuevo"
    puts "3. Buscar por ID"
    puts "4. Modificar usuario"
    puts "0. Volver"
    print "Seleccione una opción: "
    opcion = gets.chomp

    case opcion
    when "1"
      Usuario.todos.each do |u|
        puts "ID: #{u.id}, Nombre: #{u.nombre}, Correo: #{u.correo}"
      end
    when "2"
      print "Nombre: "
      nombre = gets.chomp
      print "Correo: "
      correo = gets.chomp
      usuario = Usuario.new(nombre: nombre, correo: correo)
      usuario.guardar
      puts "Usuario creado con ID: #{usuario.id}"
    when "3"
      print "ID del usuario: "
      id = gets.chomp.to_i
      usuario = Usuario.buscar(id)
      if usuario
        puts "ID: #{usuario.id}, Nombre: #{usuario.nombre}, Correo: #{usuario.correo}"
      else
        puts "Usuario no encontrado."
      end
    when "4"
      print "ID del usuario a modificar: "
      id = gets.chomp.to_i
      usuario = Usuario.buscar(id)
      if usuario
        print "Nuevo nombre (actual: #{usuario.nombre}): "
        usuario.nombre = gets.chomp
        print "Nuevo correo (actual: #{usuario.correo}): "
        usuario.correo = gets.chomp
        usuario.guardar
        puts "Usuario actualizado."
      else
        puts "Usuario no encontrado."
      end
    when "0"
      break
    else
      puts "Opción no válida."
    end
  end
end

# -- MENÚ LIBROS --

def menu_libros
  loop do
    puts "\n--- Menú de Libros ---"
    puts "1. Ver todos los libros"
    puts "2. Buscar libro por ID"
    puts "3. Crear nuevo libro"
    puts "4. Modificar libro"
    puts "5. Volver al menú principal"
    print "Elige una opción: "
    opcion = gets.chomp

    case opcion
    when "1"
      libros = Libro.todos
      if libros.empty?
        puts "No hay libros registrados."
      else
        libros.each { |libro| puts "ID: #{libro.id}, Título: #{libro.titulo}, Autor: #{libro.autor}" }
      end
    when "2"
      print "Ingresa el ID del libro: "
      id = gets.chomp.to_i
      libro = Libro.buscar(id)
      if libro
        puts "ID: #{libro.id}, Título: #{libro.titulo}, Autor: #{libro.autor}"
      else
        puts "Libro no encontrado."
      end
    when "3"
      print "Título del nuevo libro: "
      titulo = gets.chomp
      print "Autor del nuevo libro: "
      autor = gets.chomp
      libro = Libro.new(titulo: titulo, autor: autor)
      libro.guardar
      puts "Libro creado con ID #{libro.id}"
    when "4"
      print "Ingresa el ID del libro a modificar: "
      id = gets.chomp.to_i
      libro = Libro.buscar(id)
      if libro
        print "Nuevo título (actual: #{libro.titulo}): "
        nuevo_titulo = gets.chomp
        print "Nuevo autor (actual: #{libro.autor}): "
        nuevo_autor = gets.chomp
        libro.titulo = nuevo_titulo unless nuevo_titulo.strip.empty?
        libro.autor = nuevo_autor unless nuevo_autor.strip.empty?
        libro.guardar
        puts "Libro actualizado correctamente."
      else
        puts "Libro no encontrado."
      end
    when "5"
      break
    else
      puts "Opción no válida. Intenta de nuevo."
    end
  end
end

# -- MENÚ PRÉSTAMOS --

def menu_prestamos
  loop do
    puts "\n--- Menú de Préstamos ---"
    puts "1. Ver todos los préstamos"
    puts "2. Buscar préstamo por ID"
    puts "3. Crear nuevo préstamo"
    puts "4. Marcar devolución de préstamo"
    puts "5. Volver al menú principal"
    print "Elige una opción: "
    opcion = gets.chomp

    case opcion
    when "1"
      prestamos = Prestamo.todos
      if prestamos.empty?
        puts "No hay préstamos registrados."
      else
        prestamos.each do |p|
          estado = p.fecha_devolucion ? "Devuelto" : "Pendiente"
          puts "ID: #{p.id}, Usuario ID: #{p.id_usuario}, Libro ID: #{p.id_libro}, Fecha Prestamo: #{p.fecha_prestamo}, Fecha Devolución: #{estado}"
        end
      end

    when "2"
      print "Ingresa el ID del préstamo: "
      id = gets.chomp.to_i
      prestamo = Prestamo.buscar(id)
      if prestamo
        estado = prestamo.fecha_devolucion ? "Devuelto" : "Pendiente"
        puts "ID: #{prestamo.id}, Usuario ID: #{prestamo.id_usuario}, Libro ID: #{prestamo.id_libro}, Fecha Préstamo: #{prestamo.fecha_prestamo}, Fecha Devolución: #{estado}"
      else
        puts "Préstamo no encontrado."
      end

    when "3"
      print "ID del usuario: "
      id_usuario = gets.chomp.to_i
      print "ID del libro: "
      id_libro = gets.chomp.to_i
      fecha_prestamo = Time.now.strftime("%Y-%m-%d")
      prestamo = Prestamo.new(id_usuario: id_usuario, id_libro: id_libro, fecha_prestamo: fecha_prestamo)
      prestamo.guardar
      puts "Préstamo creado con ID #{prestamo.id}"

    when "4"
      print "Ingresa el ID del préstamo a marcar como devuelto: "
      id = gets.chomp.to_i
      prestamo = Prestamo.buscar(id)
      if prestamo
        if prestamo.fecha_devolucion
          puts "Este préstamo ya fue marcado como devuelto el #{prestamo.fecha_devolucion}."
        else
          prestamo.guardar
          puts "Préstamo marcado como devuelto."
        end
      else
        puts "Préstamo no encontrado."
      end

    when "5"
      break

    else
      puts "Opción no válida. Intenta de nuevo."
    end
  end
end

menu_principal
require_relative 'lib/database'

begin
  db = Database.connection
  resultados = db.execute("SELECT * FROM usuarios;")

  resultados.each do |fila|
    puts "Nombre #{fila['nombre']}, Correo: #{fila['correo']}"
  end
rescue SQLite3::Excepction => e
  puts "Ocurrió un error: #{e.message}"
end
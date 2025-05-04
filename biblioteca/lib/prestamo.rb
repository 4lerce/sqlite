# lib/prestamo.rb

require_relative 'database'
require_relative 'usuario'
require_relative 'libro'

class Prestamo
  attr_accessor :id, :id_usuario, :id_libro, :fecha_prestamo

  def initialize(id: nil, id_usuario:, id_libro:, fecha_prestamo:)
    @id = id
    @id_usuario = id_usuario
    @id_libro = id_libro
    @fecha_prestamo = fecha_prestamo
  end

  def self.todos
    db = Database.connection
    resultados = db.execute("SELECT * FROM prestamos;")
    resultados.map do |fila|
      Prestamo.new(
        id: fila["id"],
        id_usuario: fila["id_usuario"],
        id_libro: fila["id_libro"],
        fecha_prestamo: fila["fecha_prestamo"]
      )
    end
  end

  def self.buscar(id)
    db = Database.connection
    fila = db.get_first_row("SELECT * FROM prestamos WHERE id = ?;", id)
    return nil unless fila
    Prestamo.new(
      id: fila["id"],
      id_usuario: fila["id_usuario"],
      id_libro: fila["id_libro"],
      fecha_prestamo: fila["fecha_prestamo"]
    )
  end

  def guardar
    db = Database.connection
    if @id.nil?
      db.execute("INSERT INTO prestamos (id_usuario, id_libro, fecha_prestamo) VALUES (?, ?, ?);", [@id_usuario, @id_libro, @fecha_prestamo])
      @id = db.last_insert_row_id
    else
      db.execute("UPDATE prestamos SET id_usuario = ?, id_libro = ?, fecha_prestamo = ? WHERE id = ?;", [@id_usuario, @id_libro, @fecha_prestamo, @id])
    end
  end
end
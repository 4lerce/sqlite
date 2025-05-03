# lib/libro.rb

require_relative 'database'

class Libro
  attr_accessor :id, :titulo, :autor

  def initialize(id: nil, titulo:, autor:)
    @id = id
    @titulo = titulo
    @autor = autor
  end

  def self.todos
    db = Database.connection
    resultados = db.execute("SELECT * FROM libros;")
    resultados.map { |fila| 
      Libro.new(
        id: fila["id"], 
        titulo: fila["titulo"], 
        autor: fila["autor"]
      )
    }
  end

  def self.buscar(id)
    db = Database.connection
    fila = db.get_first_row("SELECT * FROM libros WHERE id = ?;", id)
    fila ? Libro.new(id: fila["id"], titulo: fila["titulo"], autor: fila["autor"]) : nil
  end

  def guardar
    db = Database.connection
    if @id.nil?
      db.execute("INSERT INTO libros (titulo, autor) VALUES (?, ?);", [@titulo, @autor])
      @id = db.last_insert_row_id
    else
      db.execute("UPDATE libros SET titulo = ?, autor = ? WHERE id = ?;", [@titulo, @autor, @id])
    end
  end
end

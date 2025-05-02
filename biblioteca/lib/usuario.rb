# lib/usuario.db

require_relative 'database'

class Usuario
  attr_accessor :id, :nombre, :correo

  def initialize(id: nil, nombre:, correo:)
    @id = id
    @nombre = nombre
    @correo = correo
  end

  def self.todos
    db = Database.connection
    resultados = db.execute("SELECT * FROM usuarios;")
    resultados.map { |fila| 
      Usuario.new(
        id: fila["id"], 
        nombre: fila["nombre"], 
        correo: fila["correo"]
      )
    }
  end

  def self.buscar(id)
    db = Database.connection
    fila = db.get_first_row("SELECT * FROM usuarios WHERE id = ?;", id)
    fila ? Usuario.new(id: fila["id"], nombre: fila["nombre"], correo: fila["correo"]) : nil
  end

  def guardar
    db = Database.connection
    if @id.nil?
      db.execute("INSERT INTO usuarios (nombre, correo) VALUES (?, ?);", [@nombre, @correo])
      @id = db.last_insert_row_id
    else
      db.execute("UPDATE usuarios SET nombre = ?, correo = ? WHERE id = ?;", [@nombre, @correo, @id])
    end
  end
end
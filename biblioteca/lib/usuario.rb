require_relative 'database'

class Usuario
  def self.todos
    db = Database.connection
    db.execute("SELECT * FROM usuarios;")
  end

  def self.buscar(id)
    db = Database.connection
    db.get_first_row("SELECT * FROM usuarios WHERE id = ?;", id)
  end

  def self.crear(nombre, correo)
    db = Database.connection
    db.execute("INSERT INTO usuarios (nombre, correo) VALUES (?, ?);", [nombre, correo])
    db.last_insert_row_id
  end
end
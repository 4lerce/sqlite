# lib/database.rb

require 'sqlite3'

class Database
  def self.connection
    @db ||= begin
      db = SQLite3::Database.new('db/biblioteca.db')
      db.results_as_hash = true
      db
    end
  end
end
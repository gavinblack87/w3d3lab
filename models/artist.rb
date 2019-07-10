require_relative('album')
require_relative('../db/sqlrunner.rb')

class Artist

  attr_reader :name

  def initialize(options)
      @name = options['name']
  end

  def save()
    sql = 'INSERT INTO artists (name) VALUES ($1) RETURNING id'
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end





end

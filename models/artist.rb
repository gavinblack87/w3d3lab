require_relative('album')
require_relative('../db/sqlrunner.rb')

class Artist

  attr_accessor :name, :id

  def initialize(options)
      @id = options['id'].to_i if options['id']
      @name = options['name']
  end

  def save()
    sql = 'INSERT INTO artists (name) VALUES ($1) RETURNING id'
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def album()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    album_hashes = SqlRunner.run(sql, values)
    albums = album_hashes.map {| album | Album.new(album) }
    return albums
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists_hashes = SqlRunner.run(sql)
    artists = artists_hashes.map{ |artist| Artist.new(artist)}
    return artists
  end





end

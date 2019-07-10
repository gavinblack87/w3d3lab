require_relative('artist')
require_relative('../db/sqlrunner.rb')

class Album

  attr_accessor :title, :genre, :artist_id, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
      @title = options['title']
      @genre = options['genre']
      @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = 'INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id'
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def artist()
    sql = "SELECT * from artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_hash = results.first
    artist = Artist.new(artist_hash)
    return artist
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums_hashes = SqlRunner.run(sql)
    albums = albums_hashes.map{ |album| Album.new(album)}
    return albums
  end





end

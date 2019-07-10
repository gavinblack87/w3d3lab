require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'The Beatles'})
artist2 = Artist.new({'name' => 'The Rolling Stones'})
artist1.save()
artist2.save()

album1 = Album.new({'title' => 'Abbey Road',
                      'genre' => 'Classic Rock',
                      'artist_id' => artist1.id})

album2 = Album.new({'title' => 'Let It Bleed',
                      'genre' => 'Rock',
                      'artist_id' => artist2.id})


album1.save()
album2.save()

album2.genre = "Punk"
album2.update()

artist1.name = "The Ringo Starrs"
artist1.update()

binding.pry
nil

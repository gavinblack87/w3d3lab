require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Artist.delete_all()
# Album.delete_all()

artist1 = Artist.new({'name' => 'The Beatles'})
artist2 = Artist.new({'name' => 'The Rolling Stones'})
artist1.save()
artist2.save()

binding.pry
nil

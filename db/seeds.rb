require_relative '../models/album'
require_relative '../models/artist'
require_relative '../models/inventory'
require_relative '../models/stock'



artist1 = Artist.new( {'name' => 'Jay Z', 'type' => 'Solo Artist'} )
artist1.save
artist2 = Artist.new( {'name' => 'Black Sabbath', 'type' => 'Group'} )
artist2.save

album1 = Album.new( {'title' => 'The Black Album', 'year' => 2003, 'artist_id' => artist1.id} )
album1.save
album2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.save

stock1 = Stock.new( {'quantity' => 2, 'buy_price' => 4.20, 'sell_price' => 10.50, 'artist_id' => artist1.id, 'album_id' => album1.id})
stock1.save
stock2 = Stock.new( {'quantity' => 12, 'buy_price' => 3.00, 'sell_price' => 9.99, 'artist_id' => artist2.id, 'album_id' => album2.id})
stock2.save
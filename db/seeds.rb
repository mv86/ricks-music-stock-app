require_relative '../models/album'
require_relative '../models/artist'
require_relative '../models/genre'
require_relative '../models/inventory'
require_relative '../models/stock'

Artist.delete_all
Album.delete_all
Genre.delete_all
Stock.delete_all

genre1 = Genre.new( {'genre' => 'Rock'} )
genre1.save
genre2 = Genre.new( {'genre' => 'US Hip Hop'} )
genre2.save
genre3 = Genre.new( {'genre' => 'Reggae'} )
genre3.save
genre4 = Genre.new( {'genre' => 'Pop'} )
genre4.save
genre5 = Genre.new( {'genre' => 'Metal'} )
genre5.save
genre6 = Genre.new( {'genre' => 'Dance'} )
genre6.save
genre7 = Genre.new( {'genre' => 'Jazz'} )
genre7.save
genre8 = Genre.new( {'genre' => 'UK Hip Hop'} )
genre8.save
genre9 = Genre.new( {'genre' => 'Indie'} )
genre9.save

artist1 = Artist.new( {'name' => 'Jay Z', 'type' => 'Solo Artist', 'genre' => genre2.genre} )
artist1.save
artist2 = Artist.new( {'name' => 'Black Sabbath', 'type' => 'Group', 'genre' => genre5.genre} )
artist2.save
artist3 = Artist.new( {'name' => 'Jehst', 'type' => 'Solo Artist', 'genre' => genre8.genre} )
artist3.save
artist4 = Artist.new( {'name' => 'Blur', 'type' => 'Group', 'genre' => genre9.genre} )
artist4.save
# artist1 = Artist.new( {'name' => 'Jay Z', 'type' => 'Solo Artist'} )
# artist1.save
# artist2 = Artist.new( {'name' => 'Black Sabbath', 'type' => 'Group'} )
# artist2.save
# artist1 = Artist.new( {'name' => 'Jay Z', 'type' => 'Solo Artist'} )
# artist1.save
# artist2 = Artist.new( {'name' => 'Black Sabbath', 'type' => 'Group'} )
# artist2.save
# artist1 = Artist.new( {'name' => 'Jay Z', 'type' => 'Solo Artist'} )
# artist1.save
# artist2 = Artist.new( {'name' => 'Black Sabbath', 'type' => 'Group'} )
# artist2.save

album1 = Album.new( {'title' => 'The Black Album', 'year' => 2003, 'artist_id' => artist1.id, 'genre' => genre2.genre} )
album1.save
album2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id, 'genre' => genre5.genre} )
album2.save
album3 = Album.new( {'title' => 'The Return Of The Drifter', 'year' => 2002, 'artist_id' => artist3.id, 'genre' => genre8.genre} )
album3.save
album4 = Album.new( {'title' => 'Falling Down', 'year' => 2003, 'artist_id' => artist3.id, 'genre' => genre8.genre} )
album4.save
album5 = Album.new( {'title' => 'Parklife', 'year' => 1996, 'artist_id' => artist4.id, 'genre' => genre9.genre} )
album5.save
album6 = Album.new( {'title' => 'Blur', 'year' => 1992, 'artist_id' => artist4.id, 'genre' => genre1.genre} )
album6.save
album7 = Album.new( {'title' => 'The Dragon Of An Ordinary Family', 'year' => 2011, 'artist_id' => artist3.id, 'genre' => genre8.genre} )
album7.save
# album2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.savealbum2 = Album.new( {'title' => 'Paranoid', 'year' => 1970, 'artist_id' => artist2.id} )
# album2.save

stock1 = Stock.new( {'quantity' => 2, 'buy_price' => 4.20, 'sell_price' => 10.50, 'artist_id' => artist1.id, 'album_id' => album1.id})
stock1.save
stock2 = Stock.new( {'quantity' => 12, 'buy_price' => 3.00, 'sell_price' => 9.99, 'artist_id' => artist2.id, 'album_id' => album2.id})
stock2.save
stock3 = Stock.new( {'quantity' => 5, 'buy_price' => 4.00, 'sell_price' => 12.99, 'artist_id' => artist3.id, 'album_id' => album3.id})
stock3.save
stock4 = Stock.new( {'quantity' => 25, 'buy_price' => 2.50, 'sell_price' => 7.99, 'artist_id' => artist3.id, 'album_id' => album4.id})
stock4.save
stock5 = Stock.new( {'quantity' => 8, 'buy_price' => 5.00, 'sell_price' => 9.99, 'artist_id' => artist4.id, 'album_id' => album5.id})
stock5.save
stock6 = Stock.new( {'quantity' => 15, 'buy_price' => 6.20, 'sell_price' => 11.49, 'artist_id' => artist4.id, 'album_id' => album6.id})
stock6.save
stock7 = Stock.new( {'quantity' => 6, 'buy_price' => 2.00, 'sell_price' => 6.79, 'artist_id' => artist3.id, 'album_id' => album7.id})
stock7.save
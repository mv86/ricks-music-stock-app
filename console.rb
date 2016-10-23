require_relative './models/album'
require_relative './models/artist'
require_relative './models/inventory'
require_relative './models/stock'

@artist1 = Artist.new('name' => 'Jay Z', 'type' => 'Solo Artist')
@artist2 = Artist.new('name' => 'Black Sabbath', 'type' => 'Group')

@artist1.save
@artist2.save
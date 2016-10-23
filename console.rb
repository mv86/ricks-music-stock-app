require_relative './models/album'
require_relative './models/artist'
require_relative './models/inventory'
require_relative './models/stock'

@artist1 = Artist.new('name' => 'Jay Z', 'type' => 'Solo')

@artist1.save
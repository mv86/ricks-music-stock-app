require 'sinatra'
require 'sinatra/contrib/all'
require 'json'
require_relative 'controllers/album_controller'
require_relative 'controllers/artist_controller'
require_relative 'controllers/genre_controller'
require_relative 'controllers/stock_controller'
require_relative 'models/stock'
require_relative 'models/inventory'

get '/' do
  @quote = Inventory.motivation_generator
  erb(:home)
end

get '/json' do
  content_type(:json)

  all_stock = Stock.all

  all_stock_array = []
  all_stock.each do |item|
    individual_stock_item = {
    "Artist Name" => item.album.artist.name,
    "Album Title" => item.album.title,
    "Quantity In Stock" => item.quantity
  }
  all_stock_array.push(individual_stock_item)
  end

  return all_stock_array.to_json
end
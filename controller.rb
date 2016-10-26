require 'sinatra'
require 'sinatra/contrib/all'
require 'json'
require_relative 'controllers/album_controller'
require_relative 'controllers/artist_controller'
require_relative 'controllers/stock_controller'
require_relative 'models/stock'
require_relative 'models/inventory'

get '/' do
  @quote = Inventory.motivation_generator
  erb(:home)
end

get '/json' do
  content_type( :json )

    all_stock = Stock.all

    all_stock_array = []
    all_stock.each do |item|
      all_stock_array << item.artist.name
      all_stock_array << item.album.title
      all_stock_array << item.quantity
    end

    return all_stock_array.to_json
  end
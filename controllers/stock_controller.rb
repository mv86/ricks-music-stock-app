#INDEX
get '/stock' do
  @stock = Stock.all
  @stock_cost = Stock.total_cost_of_current_stock
  @stock_profit = Stock.total_available_profit
  @stock_quantity = Stock.quantity_of_albums_in_stock
  @stock_very_low = Stock.very_low_stock_items
  @stock_low = Stock.low_stock_items
  erb(:'stock/index')
end

#NEW
get '/stock/new' do
  @artists = Artist.all
  @albums = Album.all
  erb(:'/stock/new')
end

#CREATE
post '/stock' do
  @stock = Stock.new(params)
  @stock.save
  redirect to('/stock')
end

#SHOW
get '/stock/:id' do
  @stock = Stock.find(params[:id])
  erb(:'stock/show')
end

#EDIT
get '/stock/:id/edit' do
  @artists = Artist.all
  @albums = Album.all
  @stock = Stock.find(params[:id])
  erb(:'/stock/edit')
end

#UPDATE
put '/stock/:id' do
  @stock = Stock.update(params)
  redirect to('/stock')
end

#DELETE
delete '/stock/:id' do
  @stock = Stock.delete(params[:id])
  redirect to('/stock')
end
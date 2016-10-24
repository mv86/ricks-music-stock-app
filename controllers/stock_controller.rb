#INDEX
get '/stock' do
  #code that returns all stock
  @stock = Stock.all
  erb(:'stock/index')
end

#NEW
get '/stock/new' do
  #code that returns me to the new stock form
end

#CREATE
post '/stock' do
  #code that creates an instance of new stock. returns to all stock page. 
end

#SHOW
get '/stock/:id' do
  #code that shows an individual stock item.
end

#EDIT
get '/stock/:id/edit' do
  #code that takes me to a stock edit form page.
end

#UPDATE
put '/stock/:id' do
  #code that returns the updated stock for this id. back to current individual stock page
end

#DELETE
delete '/stock/:id' do
  #code that deletes the current stock with this id only
end
#INDEX
get '/artists' do
  #code that returns all artists
end

#NEW
get '/artists/new' do
  #code that returns me to the new form
end

#CREATE
post '/artists' do
  #code that creates an instance of a new artist. returns to all artists page. 
end

#SHOW
get '/artists/:id' do
  #code that shows an individual artist entry.
end

#EDIT
get '/artists/:id/edit' do
  #code that takes me to an artist edit form page.
end

#UPDATE
put '/artists/:id' do
  #code that returns the updated artist for this id. back to individual artist page
end

#DELETE
delete '/artists/:id' do
  #code that deletes the current artist only
end
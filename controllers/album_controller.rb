require_relative '../models/album'
require_relative '../models/artist'
#INDEX
get '/albums' do
  #code that returns all albums
  @albums = Album.all
  erb(:'/albums/index')
end

#NEW
get '/albums/new' do
  #code that returns me to the new form
  @artists = Artist.all
  erb(:'/albums/new')
end

#CREATE
post '/albums' do
  #code that creates an instance of a new album. returns to all albums page. 
  @album = Album.new(params)
  @album.save
  redirect to(:'/albums')
end

#SHOW
get '/albums/:id' do
  #code that shows an individual album entry.
  @album = Album.find(params[:id])
  erb(:'/albums/show')
end

#EDIT
get '/albums/:id/edit' do
  #code that takes me to an album edit form page.
  @artists = Artist.all
  @album = Album.find(params[:id])
  erb(:'/albums/edit')
end

#UPDATE
put '/albums/:id' do
  #code that returns the updated album for this id. back to individual album page
  @album = Album.update(params)
  redirect to('/albums')
end

#DELETE
delete '/albums/:id' do
  #code that deletes the current album only
  @album = Album.delete(params[:id])
  redirect to('/albums')
end
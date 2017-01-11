require_relative '../models/album'
require_relative '../models/artist'
#INDEX
get '/albums' do
  query = params[:search]
  @albums_search = Album.search(query)
  @albums = Album.all
  erb(:'/albums/index')
end

#NEW
get '/albums/new' do
  @genres = Genre.all
  @artists = Artist.all
  erb(:'/albums/new')
end

#CREATE
post '/albums' do
  @album = Album.new(params)
  @album.save
  redirect to(:'/albums')
end

#SHOW
get '/albums/:id' do
  @album = Album.find(params[:id])
  erb(:'/albums/show')
end

#EDIT
get '/albums/:id/edit' do
  @genres = Genre.all
  @artists = Artist.all
  @album = Album.find(params[:id])
  erb(:'/albums/edit')
end

#UPDATE
put '/albums/:id' do
  @album = Album.update(params)
  redirect to('/albums')
end

#DELETE
delete '/albums/:id' do
  @album = Album.delete(params[:id])
  redirect to('/albums')
end
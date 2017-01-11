require_relative '../models/genre'
#INDEX
get '/genres' do
  @genres = Genre.all
  erb(:'/genres/index')
end

#NEW
get '/genres/new' do
  erb(:'/genres/new')
end

#CREATE
post '/genres' do
  @genre = Genre.new(params)
  @genre.save
  redirect to('/genres')
end

#SHOW
get '/genres/:id' do
  @genre_artists = Genre.artists(params[:id])
  @genre_albums = Genre.albums(params[:id])
  @genre = Genre.find(params[:id])
  erb(:'/genres/show')
end

#EDIT
get '/genres/:id/edit' do
  @genre = Genre.find(params[:id])
  erb(:'/genres/edit')
end

#UPDATE
put '/genres/:id' do
  @genre = Genre.update(params)
  redirect to('/genres')
end

#DELETE
delete '/genres/:id' do
  @genre = Genre.delete(params[:id])
  redirect to ('/genres')
end
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
  #code that creates an instance of a new artist. redirects to all artists page. 
  @genre = Genre.new(params)
  @genre.save
  redirect to('/genres')
end

#SHOW
get '/genres/:id' do
  #code that shows an individual artist entry.
  @genre_artists = Genre.artists(params[:id])
  @genre_albums = Genre.albums(params[:id])
  @genre = Genre.find(params[:id])
  erb(:'/genres/show')
end

#EDIT
get '/genres/:id/edit' do
  #code that takes me to an artist edit form page.
  @genre = Genre.find(params[:id])
  erb(:'/genres/edit')
end

#UPDATE
put '/genres/:id' do
  #code that returns the updated artist for this id. back to individual artist page
  @genre = Genre.update(params)
  redirect to('/genres')
end

#DELETE
delete '/genres/:id' do
  #code that deletes the current artist only
  @genre = Genre.delete(params[:id])
  redirect to ('/genres')
end
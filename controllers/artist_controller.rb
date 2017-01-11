require_relative '../models/artist'
#INDEX
get '/artists' do
  query = params[:search]
  @artists_search = Artist.search(query)
  @artists = Artist.all
  erb(:'/artists/index')
end

#NEW
get '/artists/new' do
  @genres = Genre.all
  erb(:'/artists/new')
end

#CREATE
post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  redirect to('/artists')
end

#SHOW
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:'/artists/show')
end

#EDIT
get '/artists/:id/edit' do
  @genres = Genre.all
  @artist = Artist.find(params[:id])
  erb(:'/artists/edit')
end

#UPDATE
put '/artists/:id' do
  @artist = Artist.update(params)
  redirect to('/artists')
end

#DELETE
delete '/artists/:id' do
  @artist = Artist.delete(params[:id])
  redirect to ('/artists')
end